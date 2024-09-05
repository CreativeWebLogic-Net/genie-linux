# Genie Linux Install
Genie is a Bash script to install the most popular web server used currently online.<br>
These are the components installed:<br>
<br>
  Apache2<br>
  Sqlite3<br>
  MySQL<br>
  PHP<br>
  Adminer SQL Web Interface<br>
  <a href="https://github.com/CreativeWebLogic-Net/Website-Helper">CWLNet's Website Helper PHP | CMS / Framework</a><br>
<br>
The script was created for these versions of Linux:<br>
<br>
  ubuntu<br>
  centos<br>
  debian<br>
  oracle<br>
  redhat<br>
  opensuse<br>
  arch<br>
  mint<br>
<br>
It also downloads and installs CWLNets Website Helper CMS / Framework Software.<br>
<br>
I haven't checked every Linux version Install but she should be right.<br>
<br>
Why did I create this? Because the number of times I have had to reinstall servers just kills me..<br> 
So I made these scripts just get the basics done and dusted..<br>
<br>
<br>
To Install your Lamp web server either:<br>
<br>
Download the <a href="https://github.com/CreativeWebLogic-Net/genie-linux/archive/refs/heads/main.zip">Zip</a> from GitHub.<br>
Then execute the command:<br>
"sudo unzip ./main.zip"<br>
<br>
<br>
Or just download the central script file <a href='blob:https://github.com/fd4de817-4b03-4167-8bab-db18384fd9c5'>website-helper-install.sh</a>..<br>
<br>
Next On the command line execute the script:<br>
First make the file executable.<br>
"sudo chmod +x ./website-helper-install.sh"<br>
Then run it.<br>
"sudo ./website-helper-install.sh"..<br>
Thats all you need to do.<br>
<br>
The Website Helper Software is in a Beta Version, but hopefully soon it will manage the server hosting work in built,<br>
everything from domain names to the server control panel like Plesk / CPanel.<br>
It will also run on your local development servers and VM's. It should also connet through different deployment systems like Docker / Composer / Yum / etc..<br>
So god help it, this install script is basically the only thing needed for a fresh Linux Server Install..<br>
