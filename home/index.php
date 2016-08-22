<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<meta name="description" content="" />
<title>POMAMA - </title>
    
<!-- css -->
<link href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,700,400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/styles.css" />
<script src="js/classie.js"></script>
<script>
    function init() {
        window.addEventListener('scroll', function(e){
            var distanceY = window.pageYOffset || document.documentElement.scrollTop,
                shrinkOn = 300,
                header = document.querySelector("header");
            if (distanceY > shrinkOn) {
                classie.add(header,"smaller");
            } else {
                if (classie.has(header,"smaller")) {
                    classie.remove(header,"smaller");
                }
            }
        });
    }
    window.onload = init();
</script>
</head>
<body>
<div id="wrap">
<?php include 'header.php';?>

    <div id="content-warp">

            <section>
                <div class="container">
                    <content class="cf">
<?php require('configs/main.php');
            foreach ( $directory as $d ) {
                $dirsplit = explode('/', $d);
                $dirname = $dirsplit[count($dirsplit)-2];

                printf( '<ul class="sites %1$s">', $dirname );

                foreach( glob( $d ) as $file )  {

                    $project = basename($file);

                    if ( in_array( $project, $hiddensites ) ) continue;

                    echo '<li>';

                    $siteroot = sprintf( 'http://%1$s.%2$s', $project, $tld );

                    // Display an icon for the site
                    $icon_output = '<span class="no-img"></span>';
                    foreach( $icons as $icon ) {

                        if ( file_exists( $file . '/' . $icon ) ) {
                            $icon_output = sprintf( '<img src="%1$s/%2$s">', $siteroot, $icon );
                            break;
                        } // if ( file_exists( $file . '/' . $icon ) )

                    } // foreach( $icons as $icon )
                    echo $icon_output;

                    // Display a link to the site
                    $displayname = $project;
                    if ( array_key_exists( $project, $siteoptions ) ) {
                        if ( is_array( $siteoptions[$project] ) )
                            $displayname = array_key_exists( 'displayname', $siteoptions[$project] ) ? $siteoptions[$project]['displayname'] : $project;
                        else
                            $displayname = $siteoptions[$project];
                    }
                    printf( '<a class="site" href="%1$s" target="_blank">%2$s</a>', $siteroot, $displayname );


                    // Display an icon with a link to the admin area
                    $adminurl = '';
                    // We'll start by checking if the site looks like it's a WordPress site
                    if ( is_dir( $file . '/wp-admin' ) )
                        $adminurl = sprintf( 'http://%1$s/wp-admin', $siteroot );

                    // If the user has defined an adminurl for the project we'll use that instead
                    if (isset($siteoptions[$project]) &&  is_array( $siteoptions[$project] ) && array_key_exists( 'adminurl', $siteoptions[$project] ) )
                        $adminurl = $siteoptions[$project]['adminurl'];

                    // If there's an admin url then we'll show it - the icon will depend on whether it looks like WP or not
                    if ( ! empty( $adminurl ) )
                        printf( '<a class="%2$s icon" href="%1$s">Admin</a>', $adminurl, is_dir( $file . '/wp-admin' ) ? 'wp' : 'admin' );


                    echo '</li>';

                } // foreach( glob( $d ) as $file )

                echo '</ul>';

            } // foreach ( $dir as $d )
?>
            </content>



                </div>
            </section>
     </div>
 </div>
</body>
</html>

