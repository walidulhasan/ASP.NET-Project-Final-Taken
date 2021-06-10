<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="ShopOnline_Project.Admin.products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="text-right" style="margin-bottom: 12px;">
                <a href="/Admin/createproduct.aspx" class="btn btn-primary">Create New</a>
            </div>
            <asp:ListView ID="productView" runat="server" DataKeyNames="ProductId" ItemType="ShopOnline_Project.Models.Product" SelectMethod="productView_GetData" DeleteMethod="productView_DeleteItem" UpdateMethod="productView_UpdateItem">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                            <asp:LinkButton ID="DeleteItem" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                        </td>
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
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-floppy-disk"></span></asp:LinkButton>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-floppy-remove"></span></asp:LinkButton>
                        </td>
                        <td>
                            <asp:TextBox ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                        </td>
                        <td>
                            <asp:FileUpload ImageUrl='<%# Eval("PictureFile", "~/Images/{0}") %>' runat="server" ID="PictureFileImage" Width="50px" />
                        </td>
                        
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>

                        </td>
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
                                        <th runat="server">Action Panel</th>
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
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" Text="Delete" CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                            <asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                        </td>
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
                            <asp:Label ID="PictureFileLabel" runat="server" Text='<%# Eval("PictureFile") %>' />
                        </td>
                       
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
