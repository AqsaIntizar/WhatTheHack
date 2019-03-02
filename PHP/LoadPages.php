<?php

class LoadPages {

    public static function feed($isLoggedIn, $user) {
        ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>WeStartup</title>
            <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
            <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
            <link rel="stylesheet" type="text/css" href="css/style.css">
        </head>
        <body>

        <!--<img src="images/bg.png" id="bg">-->

        <header>
            <div class="left">
                <img src="icons/hamburger.svg" id="hamburger">
                <a href="index.html" class="logo">
                    <img src="images/logo.svg">
                </a>
            </div>

            <ul class="filter-wrapper">
                <li>
                    <select>
                        <option>Projects</option>
                        <option>People</option>
                    </select>
                </li>

                <li>
                    <select>
                        <option>All Creative Fields</option>
                        <option>Coding</option>
                    </select>
                </li>

                <li>
                    <select>
                        <option>Location</option>
                        <option>People</option>
                    </select>
                </li>

                <li>
                    <select id="timeFilter">
                        <option>This Day</option>
                        <option>This Week</option>
                        <option>This Month</option>
                        <option>This Year</option>
                        <option selected="selected">All Time</option>
                    </select>
                </li>
            </ul>

            <div class="nav-actions-wrapper">
                <ul class="nav-actions">
                    <li>
                        <a href="#">
                            <img src="icons/messages.svg">
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div id="icon-container">
                                <div class="not"></div>
                                <img src="icons/notifications.svg" id="notifications">
                            </div>
                            <div id="triangle">
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </header>

        <nav>
            <div class="nav-inner">
                <img src="images/<?php echo Helper::cleanData($user->ImagePath) ?>" id="user">
                <h1>
                    <?php
                        if($isLoggedIn) {
                            echo Helper::cleanData($user->FirstName);
                        } else {
                            echo "NO HACK!";
                        }
                    ?>
                </h1>
                <span>
                    <?php
                    if($isLoggedIn) {
                        echo Helper::cleanData($user->Email);
                    } else {
                        echo "NO HACK!";
                    }
                    ?>
            </span>

                <ul class="main-nav">
                    <li class="clearfix">
                        <a href="#" class="active">
                            <img src="icons/discover-menu.svg">
                            <span>Discover</span>
                        </a>
                    </li>
                    <li class="clearfix">
                        <a href="#">
                            <img src="icons/message-menu.svg">
                            <span>Messages</span>
                        </a>
                    </li>
                    <li class="clearfix">
                        <a href="#">
                            <img src="icons/work-menu.svg">
                            <span>My Projects</span>
                        </a>
                    </li>
                    <li class="clearfix">
                        <a href="#">
                            <img src="icons/profile-menu.svg">
                            <span>Profile</span>
                        </a>
                    </li>
                </ul>

                <ul class="sub-nav">
                    <li class="clearfix">
                        <a href="#">
                            <img src="icons/settings-menu.svg">
                            <span>Settings</span>
                        </a>
                    </li>
                    <li class="clearfix">
                        <a href="#">
                            <img src="icons/help-menu.svg">
                            <span>Help</span>
                        </a>
                    </li>
                    <li class="clearfix">
                        <a href="#">
                            <img src="icons/logout-menu.svg">
                            <span>Sign Out</span>
                        </a>
                    </li>
                </ul>
            </div>
            <span id="lang">
            English
            <img src="icons/down.svg" id="down">
        </span>
            <span id="name">
            We Startup
        </span>
        </nav>

        <div id="action-menu">
            <div id="action-menu-inner">
                <div id="action-menu-padding">
                    <div id="content" class="clearfix">
                        <div id="marker">

                        </div>
                        <img src="images/user.png">
                        <p><a href="#">Chris Tan</a> accepted your invitation <span>1 hour ago</span></p>
                    </div>
                </div>
            </div>
        </div>

        <aside>
            <!-- Here comes login panel and stuff -->
        </aside>

        <main class="clearfix">
            <div class="list-item loading"></div>
        </main>

        <div id="add">
            <img src="icons/plus.svg" id="plus">
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/filter.js"></script>
        </body>
        </html>
        <?php
    }
}