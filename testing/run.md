run
===

# noop

    puppet apply --noop --modulepath=/etc/puppet/modules:/opt/unicore/puppet-manifests/modules -e "include plgrid-unicore-site"
    
# plgrid-unicore-site
        
    puppet apply --modulepath=/etc/puppet/modules:/opt/unicore/puppet-manifests/modules -e "include plgrid-unicore-site"
    
# plgrid-unicore-central
        
    puppet apply --modulepath=/etc/puppet/modules:/opt/unicore/puppet-manifests/modules -e "include plgrid-unicore-central"
    
    