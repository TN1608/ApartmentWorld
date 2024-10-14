<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sorry, This Page Can&#39;t Be Accessed</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        @import url(https://fonts.googleapis.com/css?family=Raleway:700);

        *, *:before, *:after {
            box-sizing: border-box;
        }

        html {
            height: 100%;
        }

        body {
            font-family: 'Raleway', sans-serif;
            background-color: #342643;
            height: 100%;
            padding: 10px;
        }

        a {
            color: #EE4B5E !important;
            text-decoration: none;
        }

        a:hover {
            color: #FFFFFF !important;
            text-decoration: none;
        }

        .text-wrapper {
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .title {
            font-size: 5em;
            font-weight: 700;
            color: #EE4B5E;
        }

        .subtitle {
            font-size: 40px;
            font-weight: 700;
            color: #1FA9D6;
        }

        .isi {
            font-size: 18px;
            text-align: center;
            margin: 30px;
            padding: 20px;
            color: white;
        }

        .buttons {
            margin: 30px;
            font-weight: 700;
            border: 2px solid #EE4B5E;
            text-decoration: none;
            padding: 15px;
            text-transform: uppercase;
            color: #EE4B5E;
            border-radius: 26px;
            transition: all 0.2s ease-in-out;
            display: inline-block;

            .buttons:hover {
                background-color: #EE4B5E;
                color: white;
                transition: all 0.2s ease-in-out;
            }
        }


    </style>
    <script src="/js/error/app.js"></script>
</head>
<body>
<div class="text-wrapper">
    <div class="title" data-content="404">
        403 - ACCESS DENIED
    </div>

    <div class="subtitle">
        Oops, You don't have permission to access this page.
    </div>
    <div class="isi">
        A web server may return a 403 Forbidden HTTP status code in response to a request from a client for a web page
        or resource to indicate that the server can be reached and understood the request, but refuses to take any
        further action. Status code 403 responses are the result of the web server being configured to deny access, for
        some reason, to the requested resource by the client.
    </div>

    <div class="buttons">
        <a class="button" id="errorLink" href="">Go back</a>
    </div>
</div>
</body>