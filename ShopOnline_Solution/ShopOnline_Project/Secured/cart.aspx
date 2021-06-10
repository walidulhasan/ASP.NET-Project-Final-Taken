<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="ShopOnline_Project.Secured.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: User.Identity.Name %>'s Cart</h3>
    <asp:GridView ID="cartGrid" runat="server" CssClass="table table-bordered" ItemType="ShopOnline_Project.Models.CartItemVM" DataKeyNames="CartItemId"
         SelectMethod="cartGrid_GetData" UpdateMethod="cartGrid_UpdateItem" DeleteMethod="cartGrid_DeleteItem" AutoGenerateColumns="False" OnRowDataBound="cartGrid_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-default"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-default"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProductName" HeaderText="Product" ReadOnly="True" />
            <asp:BoundField DataField="UnitPrice" DataFormatString="{0:0.00}" HeaderText="Unit Price" ReadOnly="True" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Amount" DataFormatString="{0:0.00}" HeaderText="Amount" ReadOnly="True" />
        </Columns>
    </asp:GridView>
    <div>
        <span class="pull-left">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn btn-primary">Continue Shopping</asp:HyperLink>
        </span>
        <span class="pull-right">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Secured/editprofile.aspx" CssClass="btn btn-success">Checkout</asp:HyperLink>
        </span>
    </div>
</asp:Content>
