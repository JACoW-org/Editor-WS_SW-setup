# This file was automatically generated on 2022-11-10 17:35:55 +0100.
# Use the 'puppet generate types' command to regenerate this file.

# @summary Manage zpools. Create and delete zpools. The provider WILL NOT SYNC, only report differences.
# 
# Supports vdevs with mirrors, raidz, logs, spares, and cache.
# 
# @example Using zpool.
#   zpool { 'tstpool':
#     ensure => present,
#     disk   => '/ztstpool/dsk',
#   }
Puppet::Resource::ResourceType3.new(
  'zpool',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The disk(s) for this pool. Can be an array or a space separated string.
    Puppet::Resource::Param(Any, 'disk'),

    # List of all the devices to mirror for this pool. Each mirror should be a
    # space separated string:
    # 
    #     mirror => ["disk1 disk2", "disk3 disk4"],
    Puppet::Resource::Param(Any, 'mirror'),

    # List of all the devices to raid for this pool. Should be an array of
    # space separated strings:
    # 
    #     raidz => ["disk1 disk2", "disk3 disk4"],
    Puppet::Resource::Param(Any, 'raidz'),

    # Spare disk(s) for this pool.
    Puppet::Resource::Param(Any, 'spare'),

    # Log disks for this pool. This type does not currently support mirroring of log disks.
    Puppet::Resource::Param(Any, 'log'),

    # Cache disks for this pool.
    Puppet::Resource::Param(Any, 'cache'),

    # The Alignment Shift for the vdevs in the given pool.
    Puppet::Resource::Param(Any, 'ashift'),

    # The autoexpand setting for the given pool. Valid values are `on` or `off`
    Puppet::Resource::Param(Any, 'autoexpand'),

    # The failmode setting for the given pool. Valid values are `wait`, `continue` or `panic`
    Puppet::Resource::Param(Any, 'failmode')
  ],
  [
    # The name for this pool.
    Puppet::Resource::Param(Any, 'pool', true),

    # Determines parity when using the `raidz` parameter.
    Puppet::Resource::Param(Any, 'raid_parity'),

    # The specific backend to use for this `zpool`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # zpool
    # : Provider for zpool.
    # 
    #   * Required binaries: `zpool`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['pool']
  },
  true,
  false)
