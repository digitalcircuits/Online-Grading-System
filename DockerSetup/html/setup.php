<?php

/*
Setup file for Heroku/Docker but this can also help you setup the server

WARNING: Do not change the variables below since the CS490 system is configured with these variables.
Otherwise, you will need to change the variables (such as MySQL user + pass + database) in the backend
to make it work

Script is smart enough to know its own domain
*/

$filename = 'cs490.sql';
$mysql_host = '127.0.0.1';
$mysql_username = 'root';
$mysql_password = '';
$mysql_database = 'cs490';

/* Static Variables Above - Do Not Change!*/

function join_paths(...$paths) {
    return preg_replace('~[/\\\\]+~', DIRECTORY_SEPARATOR, implode(DIRECTORY_SEPARATOR, $paths));
}

$warnPath = join_paths(getcwd(), "setup_assets", "warnfile");
$resetPath = join_paths(getcwd(), "setup_assets", "resetfile");

function warnExists()
{
    global $warnPath;
    if(file_exists($warnPath))
    {
        return True;
    }
    else
    {
        return False;
    }
}

function resetExists()
{
    global $resetPath;
    if(file_exists($resetPath))
    {
        return True;
    }
    else
    {
        return False;
    }
}

/* 
-------------SET UP-----------------
*/

// Create the database seperately

function SetupMySQL()
{
    global $mysql_database, $mysql_host, $mysql_password, $mysql_username, $filename;

    $conn = new mysqli($mysql_host, $mysql_username, $mysql_password);
    $sql = "CREATE DATABASE cs490";
    if ($conn->connect_error) {
        return array("status" => 0, "message" => "Database Connection Error (1): ". $conn->connect_error);
    } 
    else if ($conn->multi_query($sql) === TRUE) 
    {
        //Created the DB 
    } 
    else {
       return array("status" => 0, "message" => "Error creating database (2): " . $conn->error);
    }
    $conn->close();
    
    //Now import the file
    $conn = new mysqli($mysql_host, $mysql_username, $mysql_password, $mysql_database);
    $sql = file_get_contents(join_paths(getcwd(), 'setup_assets', $filename));
    if ($conn->connect_error) {
       return array("status" => 0, "message" => "Database Connection Error (3): ". $conn->connect_error);
    }else if ($conn->multi_query($sql) === TRUE) {
        $conn->close();
        return array("status" => 1, "message" => "MySQL Setup Successful!");
    } else {
        return array("status" => 0, "message" => "Import Error (4): ". $conn->error);

    }
    
    $conn->close();
}

function minPHPvar()
{
    $phpvar = explode('.', phpversion());
    $phpmajor = (int)$phpvar[0];
    if($phpmajor > 5)
    {
        return  array(
            "status" => 1
        );
    }
    elseif ($phpmajor == 5) {
        if($phpminor1 >= 4)
        {
            return array("status" => 1,"message" => "PHP version success");
        }
    }
    else
    {
        return array("status" => 0,"message" => "You need a PHP version of 5.5 to try this");
    }
}

function startInstall()
{
    $sqlresult = SetupMySQL();
    if($sqlresult['status'] == 0)
    {
        return $sqlresult;
    }
    $phpresult = minPHPvar();
    if($phpresult['status'] == 0)
    {
        return $phpresult;
    }

    return array("status" => 1, "message" => "Setup Successful");
}
/*
----------- END OF SETUP-------
*/
//--------------------------------------
/*
----- START: Resetting Functions-----------
*/
function deleteDB()
{
    global $mysql_host, $mysql_password, $mysql_username;
    $conn = new mysqli($mysql_host, $mysql_username, $mysql_password);
    $sql = "DROP DATABASE cs490";
    if ($conn->connect_error) 
    {
       
        return array("status" => 0, "message" => "Database Connection Error (7): ". $conn->connect_error);
    } 
    else if ($conn->multi_query($sql) === TRUE) 
    {
        return array("status" => 1, "message" => "Database dropped successfully");
    } 
    else {
       return array("status" => 0, "message" => "Error creating database (8): " . $conn->error);
    }
    $conn->close();
}

//Delete Folder Function
function delete_files($target) {
    if(is_dir($target)){
        $files = glob( $target . '*', GLOB_MARK ); //GLOB_MARK adds a slash to directories returned

        foreach( $files as $file ){
            delete_files( $file );      
        }

        rmdir( $target );
    } elseif(is_file($target)) {
        unlink( $target );  
    }
}

function unZip()
{
    global $warnPath;
    //Delete 'warnfile'
    unlink($warnPath);
    //Delete the directories
    delete_files(join_paths(getcwd(), 'back'));
    delete_files(join_paths(getcwd(), 'middle')); 
    delete_files(join_paths(getcwd(), 'front'));
    //Unzip zip to folder
    $zip = new ZipArchive;
    if ($zip->open(join_paths(getcwd(), "setup_assets", "static_files.zip")) === TRUE) {
        $zip->extractTo(getcwd());
        $zip->close();
        return array("status" => 1, "message" => "Successfully unzipped");
    } else {
        return array("status" => 0, "message" => "Something went wrong during unzipping");
    }
}

function doReset()
{
    global $warnPath, $resetPath;
    $deleteDBRes = deleteDB();
    if($deleteDBRes['status'] == 0)
    {
        return $deleteDBRes;
    }

    $unZipResults = unZip();
    if($unZipResults['status'] == 0)
    {
        return $unZipResults;
    }

    $sqlresult = SetupMySQL();
    if($sqlresult['status'] == 0)
    {
        return $sqlresult;
    }

    $resetFile = fopen($resetPath, "w") or array("status" => 0, "message" => "Unable to open file");
    $txtresetfile = "created";
    fwrite($resetFile, $txtresetfile);
    fclose($resetFile);


    return array("status" => 1, "message" => "reset successful");

}


/*
----- END: Resetting Functions-----------
*/
//Create a file indicating a user went to the page.
function userWent()
{
    global $warnPath, $resetPath;
    $warnFile = fopen($warnPath, "w") or array("status" => 0, "message" => "Unable to open file");
    $txtwarnfile = "created";
    fwrite($warnFile, $txtwarnfile);
    fclose($warnFile);

    if(file_exists($resetPath))
    {
        unlink($resetPath);
    }

    return array("status" => 1);

}

//Main Functions
if(isset($_GET['redir']))
{
    if(userWent()['status'] == 1)
    {
    header('Content-Type: text/html');
    echo '<script type="text/javascript">window.location.replace("./front/index.html");</script>';
    }
}
else if(isset($_GET['resetop'])) 
{
    header('Content-Type: application/json;charset=utf-8');
    echo json_encode(doReset());
}
else if(warnExists() == False && resetExists() == True)
{
    header('Content-Type: application/json;charset=utf-8');
    echo json_encode(array("status" => 1, "message" => "Setup Successful"));
}
else if(warnExists() == False)
{
    header('Content-Type: application/json;charset=utf-8');
    echo json_encode(startInstall());
}
else if(warnExists() == True)
{
    header('Content-Type: application/json;charset=utf-8');
    $datetime1 = new DateTime();
    $datetime2 = $currentTime = DateTime::createFromFormat( 'U',filemtime($warnPath) );
    $interval = $datetime1->diff($datetime2);
    $elapsed = $interval->format('%h hours %i minutes %s seconds');
    echo(json_encode(array("status" => 2, "diff" => $elapsed)));
}

?>