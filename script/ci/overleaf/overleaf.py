import pexpect
import click
import shutil
import pathlib
import subprocess
import os


@click.group()
@click.argument('git_id')
@click.argument('output_dir')
@click.argument('username')
@click.argument('password')
@click.pass_context
def overleaf(ctx, git_id, output_dir, username, password):
    ctx.ensure_object(dict)
    ctx.obj['git_id'] = git_id
    ctx.obj['output_dir'] = output_dir
    ctx.obj['username'] = username
    ctx.obj['password'] = password


@overleaf.command()
@click.pass_context
def clone(ctx):
    git_clone_cmd = 'git clone https://git.overleaf.com/' + \
        ctx.obj['git_id'] + " " + ctx.obj['output_dir']
    print(git_clone_cmd)
    with open('pexpect_clone.log', 'w') as logfile:
        child = pexpect.spawnu(git_clone_cmd, timeout=30)
        child.expect(['Username'])
        child.sendline(ctx.obj['username'])
        child.expect(['Password'])
        child.sendline(ctx.obj['password'])
        child.logfile = logfile
        child.expect(pexpect.EOF)
        child.close()

    with open('pexpect_clone.log', 'r') as logfile:
        print(logfile.read())


@overleaf.command()
@click.pass_context
def push(ctx):
    os.chdir(ctx.obj['output_dir'])
    git_push_cmd = 'git push https://git.overleaf.com/' + ctx.obj['git_id']
    print(git_push_cmd)
    with open('pexpect_push.log', 'w') as logfile:
        child = pexpect.spawnu(git_push_cmd, timeout=30)
        child.expect(['Username'])
        child.sendline(ctx.obj['username'])
        child.expect(['Password'])
        child.sendline(ctx.obj['password'])
        child.logfile = logfile
        child.expect(pexpect.EOF)
        child.close()

    with open('pexpect_push.log', 'r') as logfile:
        print(logfile.read())


@overleaf.command()
@click.pass_context
def update(ctx):
    os.system('rm -rf fonts')
    os.system('bash ./script/ci/setup.sh')
    path = pathlib.Path(ctx.obj['output_dir'])
    remove_ignore = ['.git']
    for file in path.iterdir():
        if file.name not in remove_ignore:
            if file.is_dir():
                shutil.rmtree(file)
            else:
                file.unlink()
    copy_ignore = ['.git',
                   '.github',
                   '.gitattributes',
                   '.gitignore',
                   '.latexmkrc',
                   'out',
                   ctx.obj['output_dir'],
                   'pexpect_clone.log',
                   'pexpect_push.log',
                   'script',
                   'docs'
                   ]

    parent = pathlib.Path('.')
    for file in parent.iterdir():
        if file.name not in copy_ignore:
            print("Copy: " + file.name)
            if file.is_dir():
                shutil.copytree(file, path/file.name)
            else:
                shutil.copy(file, path/file.name)

    result = subprocess.run(
        ['git', 'describe', '--always'], stdout=subprocess.PIPE)
    commit_id = result.stdout.decode('utf-8')
    print(commit_id)
    with open(path / 'config' / 'version.tex', 'a') as f:
        f.write('% Commit ID: ' + commit_id)

    os.chdir(ctx.obj['output_dir'])
    result = subprocess.run(['git', 'add', '*'], stdout=subprocess.PIPE)
    print(result.stdout.decode('utf-8'))
    result = subprocess.run(
        ['git', 'commit', '-am', '"Update to ' + commit_id + '"'], stdout=subprocess.PIPE)
    print(result.stdout.decode('utf-8'))


if __name__ == '__main__':
    overleaf(obj={})
