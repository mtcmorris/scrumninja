require 'helper'

# Keep all the stuff that could change up here
API_KEY = "a0d550405d37584fff59dd9e86cbe0cd88188e35"
PROJECT_ID = 8991
STORY_ID = 139444
SPRINT_ID = 26248

# The projects method
describe ScrumNinja, ".projects" do
  before do
    stub_request(:get, 'https://scrumninja.com/projects.xml').
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('projects.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    ScrumNinja.projects(API_KEY)
    a_request(:get, 'https://scrumninja.com/projects.xml').
    with(:query => {:api_key => API_KEY}).
    should have_been_made
  end

  it "should return the correct results" do
    projects = ScrumNinja.projects(API_KEY)
    projects.should be_an Array
    projects[0].name.should == "Tutorial Project"
    puts projects
  end
end

# The project method
describe ScrumNinja, ".project" do
  before do
    stub_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}.xml").
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('project.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    ScrumNinja.project(API_KEY,PROJECT_ID)
    a_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}.xml").
    with(:query => {:api_key => API_KEY}).
    should have_been_made
  end

  it "should return the correct results" do
    project = ScrumNinja.project(API_KEY,PROJECT_ID)
    project.should be_an Hash
    project.name.should == "Tutorial Project"
    puts project
  end
end

# The project_stories method
describe ScrumNinja, ".project_stories" do
  before do
    stub_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/stories.xml").
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('stories.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    ScrumNinja.project_stories(API_KEY,PROJECT_ID)
    a_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/stories.xml").
    with(:query => {:api_key => API_KEY}).
    should have_been_made
  end

  it "should return the correct results" do
    stories = ScrumNinja.project_stories(API_KEY,PROJECT_ID)
    stories.should be_an Array
    stories[0].name.should == "Infrastructure for project"
    puts stories[0]
  end
end

# The project_backlog method
describe ScrumNinja, ".project_backlog" do
  before do
    stub_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/backlog/index.xml").
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('backlog.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    ScrumNinja.project_backlog(API_KEY,PROJECT_ID)
    a_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/backlog/index.xml").
    with(:query => {:api_key => API_KEY}).
    should have_been_made
  end

  it "should return the correct results" do
    sprints = ScrumNinja.project_backlog(API_KEY,PROJECT_ID)
    sprints.should be_an Array
    sprints[0].stories[0].name.should == "Reset Password"
    puts sprints[0].stories[0]
  end
end

# The project_sprints method
describe ScrumNinja, ".project_sprints" do
  before do
    stub_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/sprints.xml").
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('sprints.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    ScrumNinja.project_sprints(API_KEY,PROJECT_ID)
    a_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/sprints.xml").
    with(:query => {:api_key => API_KEY}).
    should have_been_made
  end

  it "should return the correct results" do
    sprints = ScrumNinja.project_sprints(API_KEY,PROJECT_ID)
    sprints.should be_an Array
    sprints[0].goal.should == "Learn how to use the system"
    puts sprints[0]
  end
end

# The project_card_wall method
describe ScrumNinja, ".project_card_wall" do
  before do
    stub_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/card_wall.xml").
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('card_wall.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    ScrumNinja.project_card_wall(API_KEY,PROJECT_ID)
    a_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/card_wall.xml").
    with(:query => {:api_key => API_KEY}).
    should have_been_made
  end

  it "should return the correct results" do
    tasks = ScrumNinja.project_card_wall(API_KEY,PROJECT_ID)
    tasks.should be_an Array
    tasks[0].name.should == "configure database.yml"
    puts tasks[0]
  end
end

# The project_roles method
describe ScrumNinja, ".project_roles" do
  before do
    stub_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/project_roles.xml").
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('roles.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    ScrumNinja.project_roles(API_KEY,PROJECT_ID)
    a_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/project_roles.xml").
    with(:query => {:api_key => API_KEY}).
    should have_been_made
  end

  it "should return the correct results" do
    roles = ScrumNinja.project_roles(API_KEY,PROJECT_ID)
    roles.should be_an Array
    puts roles[0]
    roles[0].user.first_name.should == "Javier"
  end
end

# The project_sprint method
describe ScrumNinja, ".project_sprint" do
  before do
    stub_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/sprints/#{SPRINT_ID}.xml").
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('sprint.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    ScrumNinja.project_sprint(API_KEY,PROJECT_ID,SPRINT_ID)
    a_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/sprints/#{SPRINT_ID}.xml").
    with(:query => {:api_key => API_KEY}).
    should have_been_made
  end

  it "should return the correct results" do
    sprint = ScrumNinja.project_sprint(API_KEY,PROJECT_ID,SPRINT_ID)
    sprint.should be_an Hash
    puts sprint[0]
    sprint.goal.should == "Learn how to use the system"
  end
end

# The project_story method
describe ScrumNinja, ".project_story" do
  before do
    stub_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/stories/#{STORY_ID}.xml").
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('story.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    ScrumNinja.project_story(API_KEY,PROJECT_ID,STORY_ID)
    a_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/stories/#{STORY_ID}.xml").
    with(:query => {:api_key => API_KEY}).
    should have_been_made
  end

  it "should return the correct results" do
    story = ScrumNinja.project_story(API_KEY,PROJECT_ID,STORY_ID)
    story.should be_an Hash
    puts story[0]
    story.name.should == "Infrastructure for project"
  end
end

# The project_burndown method
describe ScrumNinja, ".project_burndown" do
  before do
    # project_burndown uses the cardwall
    stub_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/card_wall.xml").
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('card_wall.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})

    # project_backlog also uses the sprints
    stub_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/sprints.xml").
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('sprints.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    ScrumNinja.project_burndown(API_KEY,PROJECT_ID)
    a_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/card_wall.xml").
    with(:query => {:api_key => API_KEY}).
    should have_been_made

    a_request(:get, "https://scrumninja.com/projects/#{PROJECT_ID}/sprints.xml").
    with(:query => {:api_key => API_KEY}).
    should have_been_made
  end

  it "should return the correct results" do
    burndown = ScrumNinja.project_burndown(API_KEY,PROJECT_ID)
    burndown.should be_an Hash
    burndown.start.should == 1307602800000
    burndown.estimates[0].should == 2.5
    burndown.sprint_length.should == 14
  end
end

# The story_tasks method
describe ScrumNinja, ".story_tasks" do
  before do
    stub_request(:get, "https://scrumninja.com/stories/#{STORY_ID}/tasks.xml").
    with(:query => {:api_key => API_KEY}).
    to_return(:body => fixture('tasks.xml'), :headers => {'Content-Type' => 'application/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    ScrumNinja.story_tasks(API_KEY,STORY_ID)
    a_request(:get, "https://scrumninja.com/stories/#{STORY_ID}/tasks.xml").
    with(:query => {:api_key => API_KEY}).
    should have_been_made
  end

  it "should return the correct results" do
    tasks = ScrumNinja.story_tasks(API_KEY,STORY_ID)
    tasks.should be_an Array
    tasks[0].name.should == "configure database.yml"
    puts tasks[0]
  end
end


