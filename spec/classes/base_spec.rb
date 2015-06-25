require 'spec_helper'

describe 'base' do
  context 'when virtual' do
    let(:facts) {{'is_virtual' => 'true'}}
   it do
     should contain_class('vmtools')
     should contain_class('ntp')
     should contain_class('base::root_core')
     should contain_class('logrotate')
     should contain_class('bash')
     should contain_grub__kernel_param('crash_kernel').with({
     'param' => 'crashkernel',
     'value' => '512@0M'
     })
   end
  end
  context 'when physical' do
    let(:facts) {{'is_virtual' => 'false'}}
     it do
       should_not contain_class('vmtools')
       should contain_class('ntp')
       should contain_class('base::root_core')
       should contain_class('logrotate')
       should contain_class('bash')
       should contain_grub__kernel_param('crash_kernel').with({
       'param' => 'crashkernel',
       'value' => '512@0M'
       })
     end
    end
end