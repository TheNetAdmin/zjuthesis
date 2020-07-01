import pexpect
import click
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
    git_clone_cmd = 'git clone https://git.overleaf.com/' + ctx.obj['git_id'] + " " + ctx.obj['output_dir']
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
    os.system('git commit -am "Update"')
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


if __name__ == '__main__':
    overleaf(obj={})
