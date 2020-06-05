# QEMU-Automator

Spawn virtual machines with pre-configured data files. <br><br>
Repository for the project component of the course CSE4011 (Virtualization), maintained by [Shantanu Verma](https://github.com/SaurusXI), [Rohan Mukherjee](https://github.com/roerohan), and Bhavya Taneja. <br>
The tools created herein are motivated by a literature survey we performed on this subject.

## Requirements

- qemu
- kvm
- cdrtools (or genisoimage)
- cloud image - [sample](https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img)

## Usage

### Step 1

Store the cloud-image in the root directory. For the purpose of simplicity, we will refer to it as `cloud.img`.

```bash
wget -O cloud.img https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img
```

### Step 2

Edit the `user-data` according to your requirements. It is in `yaml` format.

```yaml
# cloud-config

users:
  - name: roerohan
    gecos: Rohan Mukherjee
    ssh-authorized-keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCal7SgUCiCL0oBMnuFMp/x/zYV/T1NDCYskY1A8f9vrbOg+p6jqYnuj1zM3Pgc/1/cOcW6l6c3bZb3ko1hraxz9nNC7jJPSYvc/0ZAUTa9oLTaifZdeFCwTNhi5Z23EuIH+mhpO3OSRehClMYgAvBgL/CnMkJZd6EBvTtGDho4IIo62miK/HcN4uP7sP8WoVPRjkj3QELENfR0U9YwQRlK430VCfTYKgJB2Q/YxJk3VtdPWWRXGXl9fQTQNwlULzCU5bc/dyhdWPj1IrzLTB/wsFP43PZP/SegSIxAuK/13LN+Vs3Ca+50fm/V9OCzZnFqsAM/cHRcxg12t7eDx2dUOD5vikibgfCnbhADZy1pGGSM1BS6mLoPK5hk1Fz0oh2RAbeWMA+vz+wDbudK+paN7DnCTLIylJkEZJV/edfZhqoO6HI3wYapEXOuEGGC/N91dcgMJUHfABVWLWbUAyJGk2MKztbNc7pQOLKhwPaulPh2nji6yGcZh0RmDomHNEk= roerohan@anarchy
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    groups: sudo
    shell: /bin/bash
```

### Step 3

Edit the `meta-data` file, if necessary. This is also in `yaml` format.

```yaml
instance-id: id-12345
local-hostname: virt-ubuntu
```

### Step 4

Run `script.sh`. This will automatically add your SSH key and other data from `user-data` to the image.

```bash
./script.sh
```

You will now be able to SSH into the ubuntu server, with the username and private key corresponding to the entered public key.

## License

[MIT License](./LICENSE)

# References

You can checkout your user-data configuration here:
- https://cloudinit.readthedocs.io/en/latest/topics/examples.html