<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- For Bootstrap -->
    <script src="./setup_assets/bootstrap_js/jquery-3.4.1.min.js"></script>
    <script src="./setup_assets/bootstrap_js/popper.min.js"></script>
    <script src="./setup_assets/bootstrap_js/bootstrap.min.js" ></script>
    <script src="./setup_assets/script.js" ></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./setup_assets/bootstrap_css/bootstrap.min.css">

    <style>
        .rounded {
            border-radius: 2px;
        }
    </style>

    <title>CS490 Setup Script</title>
  </head>
  <body>
<div class="github-fork-button">
<a href="https://your-url" class="github-corner" aria-label="View source on GitHub"><svg width="80" height="80" viewBox="0 0 250 250" style="fill:#151513; color:#fff; position: absolute; top: 0; border: 0; right: 0;" aria-hidden="true"><path d="M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z"></path><path d="M128.3,109.0 C113.8,99.7 119.0,89.6 119.0,89.6 C122.0,82.7 120.5,78.6 120.5,78.6 C119.2,72.0 123.4,76.3 123.4,76.3 C127.3,80.9 125.5,87.3 125.5,87.3 C122.9,97.6 130.6,101.9 134.4,103.2" fill="currentColor" style="transform-origin: 130px 106px;" class="octo-arm"></path><path d="M115.0,115.0 C114.9,115.1 118.7,116.5 119.8,115.4 L133.7,101.6 C136.9,99.2 139.9,98.4 142.2,98.6 C133.8,88.0 127.5,74.4 143.8,58.0 C148.5,53.4 154.0,51.2 159.7,51.0 C160.3,49.4 163.2,43.6 171.4,40.1 C171.4,40.1 176.1,42.5 178.8,56.2 C183.1,58.6 187.2,61.8 190.9,65.4 C194.5,69.0 197.7,73.2 200.1,77.6 C213.8,80.2 216.3,84.9 216.3,84.9 C212.7,93.1 206.9,96.0 205.4,96.6 C205.1,102.4 203.0,107.8 198.3,112.5 C181.9,128.9 168.3,122.5 157.7,114.1 C157.9,116.9 156.7,120.9 152.7,124.9 L141.0,136.5 C139.8,137.7 141.6,141.9 141.8,141.8 Z" fill="currentColor" class="octo-body"></path></svg></a><style>.github-corner:hover .octo-arm{animation:octocat-wave 560ms ease-in-out}@keyframes octocat-wave{0%,100%{transform:rotate(0)}20%,60%{transform:rotate(-25deg)}40%,80%{transform:rotate(10deg)}}@media (max-width:500px){.github-corner:hover .octo-arm{animation:none}.github-corner .octo-arm{animation:octocat-wave 560ms ease-in-out}}</style>

</div>  
  
  
<center>
<div class="container" >
        <div class="card text-center">
        <div class="card-header">
            <img src="./setup_assets/img/logo.png"> 
        </div>
        <div class="card-body">
            <img src="./setup_assets/img/loading.gif" width="64" height="64" id="page_icon">
            <h5 class="card-title" id="main-card-title">Setting Up The Backend... Please Wait...</h5>

            <p class="card-text" id="server-error" style="display: none;"></p>

            <!-- First Run Block Success -->
            <div id="first-run-user-msg-success" style="display: none">
                <p class="card-text" id="main-text-setup" style="text-decoration: underline overline red;">It is all set but here is a few things to note before trying it out </p>

                <p class="card-text" id="user-notice">
                    <ul>
                        <li>The login is a simple redirect to a HTML page if a user logs in successfully authenticates since we could not use cookies or localStorage.</li>
                        <li>Text fields that submit to the MySQL database (such as the login page or question form) are prone to SQL injections since security was not required. </li>
                        <li>Outside libraries & frameworks (such as Bootstrap and/or jQuery) were not allowed to be used.</li>
                        <li>Page aesthetics and design were not graded and therefore ignored, functionality is what was expected .</li>
                    </ul>
                </p>

                <p class="card-text" id="prod-user-warning" style="color: red; font-weight: bold">Please do not deploy in a production environment!</p>

                <p class="card-text" style="font-weight: bold"> Now with that out of the way, here is the login details! </p>

                <table class="table">
                <thead>
                    <tr>
                    <th scope="col">Account Type</th>
                    <th scope="col">Username</th>
                    <th scope="col">Password</th>
                    <th scope="col">File Location</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <th scope="row">Student</th>
                    <td>"stud"</td>
                    <td>"student"</td>
                    <td>/front/student.html</td>
                    </tr>
                    <tr>
                    <th scope="row">Teacher</th>
                    <td>"teach"</td>
                    <td>"teacher"</td>
                    <td>/front/teacher.html</td>
                    </tr>
                </tbody>
                </table>

                <button onclick= "redirectFront()" class="btn btn-primary">Take Me To The Login Page!</a>
            </div>
            <!-- End of First Run Block -->
            <!-- Warn Block -->
            <div id="warn-block-user" style="display: none">
                <p class="card-text" id="main-text-setup-warn-used" style="text-decoration: underline overline red;"> </p>

                <p class="card-text" id="main-text-setup">Here is a few things to note:</p>

                <p class="card-text" id="user-notice">
                    <ul>
                        <li>The login is a simple redirect to a HTML page if a user logs in successfully authenticates since we could not use cookies or localStorage.</li>
                        <li>Text fields that submit to the MySQL database (such as the login page or question form) are prone to SQL injections since security was not required. </li>
                        <li>Outside libraries & frameworks (such as Bootstrap and/or jQuery) were not allowed to be used.</li>
                        <li>Page aesthetics and design were not graded and therefore ignored, functionality is what was expected .</li>
                    </ul>
                </p>

                <p class="card-text" id="prod-user-warning" style="font-weight: bold">With that being said, someone may have tried mess or break the project. If the project for some reason is not working or contains broken text. Come back to this homepage and reset the server.</p>

                <p class="card-text" style="font-weight: bold">Login Details: </p>
                <table class="table">
                <thead>
                    <tr>
                    <th scope="col">Account Type</th>
                    <th scope="col">Username</th>
                    <th scope="col">Password</th>
                    <th scope="col">File Location</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <th scope="row">Student</th>
                    <td>"stud"</td>
                    <td>"student"</td>
                    <td>/front/student.html</td>
                    </tr>
                    <tr>
                    <th scope="row">Teacher</th>
                    <td>"teach"</td>
                    <td>"teacher"</td>
                    <td>/front/teacher.html</td>
                    </tr>
                </tbody>
                </table>

                <a href="./front/index.html" class="btn btn-primary">Take Me To The Login Page!</a> 
                <br>
                <br>
                <button onclick="onReset()" class="btn btn-danger">Reset the Server</a>


            </div>



        </div>
        </div>
        </div>



  </div>

  <script>
        setTimeout(onLoad, 6000);
  </script>
</center>
  </body>
</html>
