Company.destroy_all
Job.destroy_all
Category.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U", 'G School', 'CCs Coffee']
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = ['Web Developer', 'Software Engineer', 'Human Relations', 'Team Lead', 'Software Development', 'Manufacturing Engineer', 'UX Specialist', 'Database Analytics', 'Implementation Consultant', 'UX Designer']

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  category = Category.create!(title: CATEGORIES.shift)
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(93), city: CITIES.sample, category_id: category.id)
    puts "Created #{company.jobs[num].title} with #{category.title}"
  end
end
