# This file was automatically generated on 2022-11-10 15:16:26 -0500.
# Use the 'puppet generate types' command to regenerate this file.

# @summary Installs and manages ssh host keys.
# By default, this type will install keys into `/etc/ssh/ssh_known_hosts`.
# To manage ssh keys in a different `known_hosts` file, such as a user's personal
# `known_hosts`, pass its path to the `target` parameter. See the
# `ssh_authorized_key` type to manage authorized keys.
Puppet::Resource::ResourceType3.new(
  'sshkey',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The key itself; generally a long string of uuencoded characters. The `key`
    # attribute may not contain whitespace.
    # 
    # Make sure to omit the following in this attribute (and specify them in
    # other attributes):
    # 
    # * Key headers, such as 'ssh-rsa' --- put these in the `type` attribute.
    # * Key identifiers / comments, such as 'joescomputer.local' --- put these in
    #   the `name` attribute/resource title.
    Puppet::Resource::Param(Any, 'key'),

    # Any aliases the host might have.  Multiple values must be
    # specified as an array.
    Puppet::Resource::Param(Any, 'host_aliases'),

    # The file in which to store the ssh key.  Only used by
    # the `parsed` provider.
    Puppet::Resource::Param(Any, 'target')
  ],
  [
    # The encryption type used.  Probably ssh-dss or ssh-rsa.
    # 
    # Valid values are `ssh-dss` (also called `dsa`), `ssh-ed25519` (also called `ed25519`), `ssh-rsa` (also called `rsa`), `ecdsa-sha2-nistp256`, `ecdsa-sha2-nistp384`, `ecdsa-sha2-nistp521`, `sk-ecdsa-sha2-nistp256@openssh.com` (also called `ecdsa-sk`), `sk-ssh-ed25519@openssh.com` (also called `ed25519-sk`).
    Puppet::Resource::Param(Enum['ssh-dss', 'dsa', 'ssh-ed25519', 'ed25519', 'ssh-rsa', 'rsa', 'ecdsa-sha2-nistp256', 'ecdsa-sha2-nistp384', 'ecdsa-sha2-nistp521', 'sk-ecdsa-sha2-nistp256@openssh.com', 'ecdsa-sk', 'sk-ssh-ed25519@openssh.com', 'ed25519-sk'], 'type', true),

    # The host name that the key is associated with.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `sshkey`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # parsed
    # : Parse and generate host-wide known hosts files for SSH.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /^(.*?)@(.*)$/ => ['name', 'type'],
    /^([^@]+)$/ => ['name']
  },
  true,
  false)
