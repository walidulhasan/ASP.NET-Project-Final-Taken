<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="ShopOnline_Project.Admin.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowModelStateErrors="true" />
           
            <asp:ListView ID="categoryView" runat="server" DataKeyNames="CategoryId" ItemType="ShopOnline_Project.Models.Category"  InsertItemPosition="LastItem" SelectMethod="categoryView_GetData" InsertMethod="categoryView_InsertItem" UpdateMethod="categoryView_UpdateItem" DeleteMethod="categoryView_DeleteItem">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit"  CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                        </td>
                        <td>
                            <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>' />
                        </td>
                        <td>
                            <asp:HyperLink runat="server" ID="hlproducts" NavigateUrl='<%# Eval("categoryid", "~/Admin/categoryproducts.aspx?c={0}") %>'>View Products</asp:HyperLink>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                             <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-floppy-disk"></span></asp:LinkButton>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Cancel" Text="Cancel"  CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-floppy-remove"></span></asp:LinkButton>
                         </td>
                        <td>
                            <asp:TextBox ID="CategoryNameTextBox" runat="server" Text='<%# Bind("CategoryName") %>' />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                             <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-primary btn-sm"></asp:LinkButton>
                            <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel"  CssClass="btn btn-danger btn-sm"></asp:LinkButton>
                        </td>
                        <%--<td>&nbsp;</td>--%>
                        <td>
                            <asp:TextBox ID="CategoryNameTextBox" runat="server" Text='<%# Bind("CategoryName") %>' />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
 
                             <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" Text="Edit"  CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                        </td>
                        <td>
                            <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>' />
                        </td>
                        <td>
                            <asp:HyperLink runat="server" ID="hlproducts" NavigateUrl='<%# Eval("categoryid", "~/Admin/categoryproducts.aspx?c={0}") %>'>View Products</asp:HyperLink>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-bordered">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">CategoryName</th>
                                        <th>View</th>
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
                             <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-save"></span></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" Text="Edit"  CssClass="btn btn-primary btn-sm"><span class="glyphicon glyphicon-refresh"></span></asp:LinkButton>
                        </td>
                        <td>
                            <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>' />
                        </td>
                        <td>
                            <asp:HyperLink runat="server" ID="hlproducts" NavigateUrl='<%# Eval("categoryid", "~/Admin/categoryproducts.aspx?c={0}") %>'>View Products</asp:HyperLink>
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
