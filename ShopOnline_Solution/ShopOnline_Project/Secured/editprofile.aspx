<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editprofile.aspx.cs" Inherits="ShopOnline_Project.Secured.editprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="alert alert-warning alert-dismissible" role="alert" id="msg" runat="server">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Warning!</strong> Some data are missing in your profile. Please fill up data and then continue.
    </div>

    <div>
        <div class="form-group">
            <asp:Label ID="Label1" CssClass="control-label" runat="server" Text="Label">CustomerName:</asp:Label>
            <asp:TextBox ID="CustomerNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CustomerName") %>' />
        </div>
        <div class="form-group">
            <asp:Label ID="Label2" CssClass="control-label" runat="server" Text="Label">Address:</asp:Label>
            <asp:TextBox ID="AddressTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Address") %>' />
        </div>
        <div class="form-group">
            <asp:Label ID="Label3" CssClass="control-label" runat="server" Text="Label">CCNumber:</asp:Label>
            <asp:TextBox ID="CCNumberTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CCNumber") %>' />
        </div>
        <div class="form-group">
            <asp:Label ID="Label4" CssClass="control-label" runat="server" Text="Label">CCExpire:</asp:Label>
            <asp:TextBox ID="CCExpireTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CCExpire") %>' />
        </div>
        <div class="form-group">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save and Continue" OnClick="UpdateButton_Click" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </div>
    </div>


</asp:Content>
