namespace :cleanup do
  desc "Remove controller and associated files"
  task :remove_controller, [:controller_name] => :environment do |t, args|
    controller_name = args[:controller_name]

    # Define paths to delete
    controller_file = "app/controllers/#{controller_name}_controller.rb"
    views_dir = "app/views/#{controller_name}"
    helper_file = "app/helpers/#{controller_name}_helper.rb"
    test_file = "test/controllers/#{controller_name}_controller_test.rb"
    spec_file = "spec/controllers/#{controller_name}_controller_spec.rb"
    js_file = "app/assets/javascripts/#{controller_name}.js"
    css_file = "app/assets/stylesheets/#{controller_name}.css"

    # Delete the controller file
    if File.exist?(controller_file)
      puts "Deleting #{controller_file}"
      File.delete(controller_file)
    end

    # Delete the associated views folder
    if Dir.exist?(views_dir)
      puts "Deleting #{views_dir}"
      FileUtils.rm_rf(views_dir)
    end

    # Delete the helper file
    if File.exist?(helper_file)
      puts "Deleting #{helper_file}"
      File.delete(helper_file)
    end

    # Delete test files
    if File.exist?(test_file)
      puts "Deleting #{test_file}"
      File.delete(test_file)
    elsif File.exist?(spec_file)
      puts "Deleting #{spec_file}"
      File.delete(spec_file)
    end

    # Delete JavaScript and CSS files
    if File.exist?(js_file)
      puts "Deleting #{js_file}"
      File.delete(js_file)
    end

    if File.exist?(css_file)
      puts "Deleting #{css_file}"
      File.delete(css_file)
    end

    puts "Controller and associated files for '#{controller_name}' removed."
  end
end
