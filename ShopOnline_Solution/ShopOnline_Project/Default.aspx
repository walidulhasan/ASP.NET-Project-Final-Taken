<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShopOnline_Project._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!--SLIDER Srart-->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="slider_img/1.jpg" alt="...">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
            <div class="item">
                <img src="slider_img/2.jpg" alt="...">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
            <div class="item">
                <img src="slider_img/3.jpg" alt="...">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
            ...
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!--SLIDER End-->

    <div class="container">
        <div class="row">
            <div class="col-md-4 text-center" style="padding-top: 20px;">
                <img src="slider_img/w2.png" class="img-circle" alt="Cinque Terre" width="200" height="150">
                <h2>Coose Your Laptop</h2>
                <h4>Best Laptop</h4>
                <p>
                    We make it easy to find your ideal desktop or all-in-one with our top picks.
                </p>

            </div>
            <div class="col-md-4 text-center" style="padding-top: 20px;">
                <img src="slider_img/w3.png" class="img-circle" alt="Cinque Terre" width="200" height="150">
                <h2>Top Tablet PC</h2>
                <h4>Latest Tablet</h4>
                <p>
                    We make it easy to find your ideal desktop or all-in-one with our top picks.
                </p>
            </div>
            <div class="col-md-4 text-center" style="padding-top: 20px;">
                <img src="slider_img/w4.png" class="img-circle" alt="Cinque Terre" width="200" height="150">
                <h2>Networking Device</h2>
                <h4>Buy the latest Networking devices</h4>
                <p>
                    We make it easy to find your ideal desktop or all-in-one with our top picks.
                </p>
            </div>
        </div>
    </div>
</asp:Content>
