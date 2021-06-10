<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="confirmorder.aspx.cs" Inherits="ShopOnline_Project.Secured.confirmorder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Customer Info</h3>
    <asp:GridView ID="billingGrid" runat="server" SelectMethod="billingGrid_GetData"></asp:GridView>
    <h3>Order Details</h3>
    <asp:GridView ID="detailsGrid" runat="server" SelectMethod="detailsGrid_GetData"></asp:GridView>
    <div>
      
        <span class="pull-right">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Secured/confirm.aspx" CssClass="btn btn-success">Confirm Order</asp:HyperLink>
        </span>
    </div>
</asp:Content>
