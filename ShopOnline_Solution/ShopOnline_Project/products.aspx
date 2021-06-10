<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="ShopOnline_Project.products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater ID="productRepeater" runat="server" ItemType="ShopOnline_Project.Models.Product" SelectMethod="productRepeater_GetData">
        <HeaderTemplate>
        </HeaderTemplate>
        <ItemTemplate>

            <div class="panel panel-default">
                <div class="panel-heading"><%# Eval("ProductName") %></div>
                <div class="panel-body">
                    <div>
                        <asp:Image ID="productIamge" runat="server" ImageUrl='<%# Eval("PictureFile", "~/Images/{0}") %>' CssClass="img-rounded" />
                        <span class="pull-right label label-primary"><%# Eval("UnitPrice", "{0:0.00 BDT}") %></span>
                    </div>
                    <div>
                        <%# Eval("Description") %>
                    </div>
                    <div class="text-right">
                        <asp:HyperLink ID="hlBuy" runat="server" NavigateUrl='<%# Eval("ProductId", "~/Secured/cart.aspx?id={0}") %>' CssClass="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</asp:HyperLink>
                    </div>
                </div>

            </div>

        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
