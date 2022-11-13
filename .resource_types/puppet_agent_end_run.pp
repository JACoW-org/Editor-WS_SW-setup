# This file was automatically generated on 2022-11-10 17:35:56 +0100.
# Use the 'puppet generate types' command to regenerate this file.

# Stops the current Puppet run if a puppet-agent upgrade was
# performed. Used on platforms that manage the Puppet Agent upgrade with
# a package resource, as resources evaluated after an upgrade might
# cause unexpected behavior due to a mix of old and new Ruby code being
# loaded in memory.
# 
# Platforms that shell out to external scripts for upgrading (Windows,
# macOS, and Solaris 10) do not need to use this type.
Puppet::Resource::ResourceType3.new(
  'puppet_agent_end_run',
  [
    # Stops the current puppet run
    Puppet::Resource::Param(Any, 'end_run')
  ],
  [
    # The desired puppet-agent version
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `puppet_agent_end_run`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # puppet_agent_end_run
    # :
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
