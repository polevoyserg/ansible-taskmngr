from testinfra.utils.ansible_runner import AnsibleRunner

testinfra_ansible = AnsibleRunner('.molecule/ansible_inventory')
testinfra_hosts = testinfra_ansible.get_hosts('test')


def test_command(Command):
    assert Command('docker ps | grep docker_registry').rc == 0
