# This file was automatically generated on 2022-11-10 15:16:23 -0500.
# Use the 'puppet generate types' command to regenerate this file.

# Allows managing config settings for Chocolatey.
# Configuration values provide settings for users
# to configure aspects of Chocolatey and the way it
# functions. Similar to features, except allow for user
# configured values. Requires 0.9.10+. Learn more about
# config at https://chocolatey.org/docs/commands-config
Puppet::Resource::ResourceType3.new(
  'chocolateyconfig',
  [
    # Specifies state of resource
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The value of the config setting. If the
    # name includes 'password', then the value is
    # not ensurable due to being encrypted in the
    # configuration file.
    Puppet::Resource::Param(Any, 'value')
  ],
  [
    # The name of the config setting. Used for uniqueness.
    # Puppet is not able to easily manage any values that
    # include Password in the key name in them as they
    # will be encrypted in the configuration file.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `chocolateyconfig`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # windows
    # : Windows based provider for chocolateyconfig type.
    # 
    #   * Required binaries: `choco.exe`.
    #   * Default for `operatingsystem` == `windows`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
