module Demoable
  class Engine < ::Rails::Engine
    isolate_namespace Demoable
    initializer 'demoable.load_helpers' do
      ActiveSupport.on_load(:action_controller) do
        include Demoable::Helpers
      end
    end 
  end
end
