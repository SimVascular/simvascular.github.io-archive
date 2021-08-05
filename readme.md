# SimVascular Website (compiled branch)

This is the repository for the SimVascular website.

# Usage

The source of the SimVascular website documentation is stored in the **source** branch. The documentation is written in a lightweight markup language with plain text formatting syntax called [markdown](https://daringfireball.net/projects/markdown). Markdown .md files can be editied using a text editor.

The documentation markdown files in the **source** branch are used to generate the SimVascular website html files using the **ruby** programming language. These html files are then pushed to the **master** branch. The SimVascular website will automatically detect the changed **master** branch and update itself. DO NOT edit the **master** branch files!

You should first fork **simvascular.github.io** to your own repository and then sync it with https://github.com/SimVascular/simvascular.github.io. For example, after forking to **https://github.com/ktbolt/simvascular.github.io**

```
$ git clone https://github.com/ktbolt/simvascular.github.io
$ cd simvascular.github.io
$ git remote add upstream https://github.com/SimVascular/simvascular.github.io
$ git remote -v
origin	https://github.com/ktbolt/simvascular.github.io (fetch)
origin	https://github.com/ktbolt/simvascular.github.io (push)
upstream	https://github.com/SimVascular/simvascular.github.io (fetch)
upstream	https://github.com/SimVascular/simvascular.github.io (push)
```

Be sure to pull in any changes to the remote **source** branch
```
$ git fetch upstream
$ git checkout source
$ git merge upstream/source
$ git push origin source
```

### Setting up for editing

Create a clone of the **master** branch and then check out the **source** branch
```
$ git clone https://github.com/SimVascular/simvascular.github.io.git
$ cd simvascular.github.io
$ git checkout source
```

Install the following packages

```
$ sudo apt-get install ruby ruby-dev
$ sudo apt-get install nodejs
$ gem install bundler (may prompt for password for sudo access)
$ bundle install (get dependencies)
```

### Editing the ***User Guides*** Documentation

The documentation for the **User Guides** is stored in markdown files located in subdirectories under the *simvascular.github.io/source/documentation/* directory

```
compile/
flowsolver/
genbc/
installation/
meshing/
modeling/
quickguide/
refs/
svFSI/
```
The documentation markdown files for the **Clinical Case Studies** are located in subdirectories under the *simvascular.github.io/source/clinical* directory
```
aortofemoral1/
aortofemoral2/
coronary/
pulmonary/
```
The results of documentation edits can be viewed using a local web server. The web server is started using
```
$ bundle exec middleman server
```
View the SimVascular website html files generated from the markdown file edits by opening the url *http://0.0.0.0:4567* in a browser. The results of new edit are view by refreshing the browser.

### Editing the Home Page ***Our Team*** Section

The content for the home page **Our Team** section is stored in the **_team.erb** embedded Ruby file located in the *simvascular.github.io/source/homepage* directory. Edit this file to add or remove the picture and biography of a team member. The team member pictures are located in the *simvascular.github.io/source/img/bio* directory. The new team picture must have the same width, height (242x200) and resolution (72x72) as the other team pictures in order for the team boxes to correctly line up. You can set these properties using the GIMP image editor by selecting **image** -> **Print Size ...**.

The team member biographies are stored in markdown files located in the *simvascular.github.io/source/homepage/team_members* directory. To view changes made to the team picture you must stop and restart the middleman web server. 

### Building the **master** branch production files

The **master** branch html files are generated from the **source** branch by running
```
$ bundle exec middleman build
```
in the top level **simvascular.github.io** directory. This creates a **build** directory containing the html files to be pushed to the **master** branch. Copy the **build** directory someplace outside of the **simvascular.github.io**, checkout the **master** the branch, and copy the files in **build** directory. For example
```
$ cd simvascular.github.io
$ git branch
source
$ bundle exec middleman build
$ cp -r build ~
$ git checkout master
$ cp -r ~/build/* .
$ git add .
$ git commit
$ git push origin master
```

Do a pull request on **master** and merge into the remote **master** branch. The changes will then appread on **http://simvascular.github.io**.


