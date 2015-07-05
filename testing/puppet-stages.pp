# Setting additional run stages:
#
stage { 'system':
  before => Stage['main']
}

stage { 'overture':
  before => Stage['system']
}

stage { 'finale': }

Stage['main'] -> Stage['finale']


# Assign classes to stages:
#
#class { 'yumrepos':
#  stage => 'system',
#}->
#class { 'packages':
#  stage => 'system',
#}
