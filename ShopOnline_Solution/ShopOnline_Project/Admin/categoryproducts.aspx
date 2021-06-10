<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="categoryproducts.aspx.cs" Inherits="ShopOnline_Project.Admin.categoryproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="text-left" style="margin-bottom: 12px;">
                <a href="/Admin/Categories.aspx" class="btn btn-primary">Back To Category List</a>
            </div>
            <asp:ListView ID="ListView1" runat="server" SelectMethod="ListView1_GetData">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                        </td>
                        <td>
                            <asp:Image ImageUrl='<%# Eval("PictureFile", "~/Images/{0}") %>' runat="server" ID="PictureFileImage" Width="50px" />
                        </td>
                       
                    </tr>
                </AlternatingItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                        </td>
                        <td>
                            <asp:Image ImageUrl='<%# Eval("PictureFile", "~/Images/{0}") %>' runat="server" ID="PictureFile" Width="50px" />
                        </td>
                       
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-bordered">
                                    <tr runat="server" style="">
                                        <th runat="server">Product Name</th>
                                        <th runat="server">Unit Price</th>
                                        <th runat="server">Description</th>
                                        <th runat="server">Picture File</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
