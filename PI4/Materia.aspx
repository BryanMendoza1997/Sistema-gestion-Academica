<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="Materia.aspx.cs" Inherits="PI4.Materia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 156px;
        }
        .auto-style2 {
            width: 156px;
            height: 22px;
        }
        .auto-style3 {
            height: 22px;
        }
        .auto-style5 {
            height: 22px;
            width: 316px;
        }
        .auto-style6 {
            width: 316px
        }
        .auto-style8 {
            width: 824px;
        }
        .auto-style9 {
            width: 85px;
        }
        .auto-style14 {
            height: 45px;
        }
        .auto-style16 {
            height: 46px;
            width: 270px;
        }
        .auto-style17 {
            height: 45px;
            width: 270px;
        }
        .auto-style18 {
            width: 270px;
        }
        .auto-style19 {
            height: 46px;
        }
        .auto-style21 {
            height: 46px;
            width: 90px;
        }
        .auto-style22 {
            height: 45px;
            width: 90px;
        }
        .auto-style24 {
            width: 90px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid"  style="margin: 0px 0;">
            <div class="row">
                <div class="imagendiv">
                    <img src="assets/img/flat-book.png" alt="pdf"  class="imgCentrada" style="max-width: 110px; width: 274px; height: 229px;"/>
                </div>
                <div class="parrafo">
                    <div class="pa">
                       Bienvenido a la sección para agregar, modificar y eliminar materias.
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <form autocomplete="off">
                <div class="container-flat-form">
                    <div class="title-flat-form title-flat-blue">
                        <asp:LinkButton ID="LinkButton1" runat="server">Agregar Materia</asp:LinkButton>
                    </div>
                </div>
                <div>
                     <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Agregar Materia Munualmente </asp:LinkButton>

                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Agregar Materias por medio de archivo en excel.</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

                </div>
                <div>
                     <asp:MultiView ID="MultiView1" runat="server">
                         <asp:View ID="View3" runat="server">
                             <table style="width:100%;">
                                 <tr>
                                     <td class="auto-style9">&nbsp;</td>
                                     <td>&nbsp;</td>
                                     <td>&nbsp;</td>
                                 </tr>
                                 <tr>
                                     <td class="auto-style9">Carrera</td>
                                     <td>
                                         <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="ID_CARRERA" Width="307px" AutoPostBack="True">
                                         </asp:DropDownList>
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="Filtrar" Width="96px" />
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     </td>
                                     <td>&nbsp;</td>
                                 </tr>
                                 <tr>
                                     <td class="auto-style9">&nbsp;</td>
                                     <td>&nbsp;</td>
                                     <td>&nbsp;</td>
                                 </tr>
                             </table>
                             <div class="GridViewMaterias">
                                 <div class="Materia">
                                 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Materias" DataSourceID="SqlDataSource3" Width="547px" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                                     <AlternatingRowStyle BackColor="White" />
                                     <Columns>
                                         <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                         <asp:BoundField DataField="ID_Materias" HeaderText="ID_Materias" InsertVisible="False" ReadOnly="True" SortExpression="ID_Materias" Visible="False" />
                                         <asp:TemplateField HeaderText="Materia" SortExpression="Materia">
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="TextMateria" runat="server" Text='<%# Bind("Materia") %>'></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextMateria" ErrorMessage="* Campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("Materia") %>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Modulo" SortExpression="Modulo">
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="TextModulo" runat="server" Text='<%# Bind("Modulo") %>'></asp:TextBox>
                                                 <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextModulo" ErrorMessage="Solo Valores entre 1-10." ForeColor="Red" MaximumValue="10" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("Modulo") %>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                     </Columns>
                                     <EditRowStyle BackColor="#999999" />
                                     <FooterStyle BackColor="#00A651" Font-Bold="True" ForeColor="White" />
                                     <HeaderStyle BackColor="#00A651" Font-Bold="True" ForeColor="White" />
                                     <PagerSettings FirstPageText="&amp;lt;&amp;lt;&amp;lt;&amp;lt;" LastPageText="&amp;gt;&amp;gt;&amp;gt;" NextPageText="&amp;gt;&amp;gt;&amp;gt;&amp;gt;" PreviousPageText="&amp;lt;&amp;lt;&amp;lt;&amp;lt;&amp;lt;" />
                                     <PagerStyle BackColor="#00A651" ForeColor="White" HorizontalAlign="Center" />
                                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                 </asp:GridView>
                                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" DeleteCommand="DELETE FROM [TB_MATERIAS] WHERE [ID_Materias] = @ID_Materias" InsertCommand="INSERT INTO [TB_MATERIAS] ([Materia], [Modulo]) VALUES (@Materia, @Modulo)" SelectCommand="SELECT [ID_Materias], [Materia], [Modulo] FROM [TB_MATERIAS] WHERE ([ID_Carrera] = @ID_Carrera) ORDER BY [Modulo]" UpdateCommand="UPDATE [TB_MATERIAS] SET [Materia] = @Materia, [Modulo] = @Modulo WHERE [ID_Materias] = @ID_Materias">
                                         <DeleteParameters>
                                             <asp:Parameter Name="ID_Materias" Type="Int32" />
                                         </DeleteParameters>
                                         <InsertParameters>
                                             <asp:Parameter Name="Materia" Type="String" />
                                             <asp:Parameter Name="Modulo" Type="Int32" />
                                         </InsertParameters>
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="DropDownList2" Name="ID_Carrera" PropertyName="SelectedValue" Type="Int32" />
                                         </SelectParameters>
                                         <UpdateParameters>
                                             <asp:Parameter Name="Materia" Type="String" />
                                             <asp:Parameter Name="Modulo" Type="Int32" />
                                             <asp:Parameter Name="ID_Materias" Type="Int32" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>
                                </div>
                             </div>
                         </asp:View>
                         <asp:View ID="View2" runat="server">
                             <table style="width:100%;">
                                 <tr>
                                     <td class="auto-style21">Semestre :</td>
                                     <td class="auto-style16">
                                         <asp:DropDownList ID="DropDownListSemestre" runat="server" DataSourceID="SqlDataSource4" DataTextField="SEMESTRE" DataValueField="ID_SEMESTRE" Width="207px">
                                         </asp:DropDownList>
                                     </td>
                                     <td class="auto-style19">&nbsp;</td>
                                     <td class="auto-style19"></td>
                                     <td class="auto-style19"></td>
                                 </tr>
                                 <tr>
                                     <td class="auto-style22">Carrera :</td>
                                     <td class="auto-style17">
                                         <asp:DropDownList ID="DropDownListCarrera" runat="server" DataSourceID="SqlDataSource2" DataTextField="NOMBRE" DataValueField="ID_CARRERA" Width="260px">
                                         </asp:DropDownList>
                                     </td>
                                     <td class="auto-style14">&nbsp;</td>
                                     <td class="auto-style14">&nbsp;</td>
                                     <td class="auto-style14"></td>
                                 </tr>
                                 <tr>
                                     <td class="auto-style24">Materia :</td>
                                     <td class="auto-style18">
                                         <asp:TextBox ID="textMateria" runat="server" Width="251px"></asp:TextBox>
                                     </td>
                                     <td>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="textMateria" ErrorMessage="*  Campo Obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                                     </td>
                                     <td>&nbsp;</td>
                                     <td>&nbsp;</td>
                                 </tr>
                                 <tr>
                                     <td class="auto-style24">&nbsp;</td>
                                     <td class="auto-style18">
                                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT [ID_CARRERA], [NOMBRE] FROM [TB_CARRERA]"></asp:SqlDataSource>
                                     </td>
                                     <td>
                                         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT [ID_SEMESTRE], [SEMESTRE] FROM [TB_SEMESTRE]"></asp:SqlDataSource>
                                     </td>
                                     <td>&nbsp;</td>
                                     <td>&nbsp;</td>
                                 </tr>
                                 <tr>
                                     <td class="auto-style24">&nbsp;</td>
                                     <td class="auto-style18">
                                         <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Guardar" Width="109px" />
                                     </td>
                                     <td>&nbsp;
                                         <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Cancelar" Width="113px" CausesValidation="False" />
                                     </td>
                                     <td>&nbsp;</td>
                                     <td>&nbsp;</td>
                                 </tr>
                             </table>
                         </asp:View>
                 <asp:View ID="View1" runat="server">
                       <table style="width:100%;">
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Subir Maya en Exel: </td>
                            <td class="auto-style5">
                                <asp:FileUpload ID="FileUpload1" runat="server" OnLoad="FileUpload1_Load" Width="383px" />
                            </td>
                            <td class="auto-style3">
                                <asp:Button ID="Button1" runat="server" Text="Cargar Materias" Width="123px" OnClick="Button1_Click" />
                            </td>
                        </tr>
                           <tr>
                               <td class="auto-style2">&nbsp;</td>
                               <td class="auto-style5">&nbsp;</td>
                               <td class="auto-style3">&nbsp;</td>
                           </tr>
                        <tr>
                            <td class="auto-style1">Carrera:</td>
                            <td class="auto-style6">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="ID_CARRERA" Width="253px">
                                </asp:DropDownList>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT [ID_CARRERA], [NOMBRE] FROM [TB_CARRERA]"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                            <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                           <tr>
                               <td>
                                   <asp:Label ID="Label1" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
                               </td>
                           </tr>
                    </table>
                     <div style="margin-left: 103px">
                <asp:GridView ID="GridView1" runat="server" Width="619px" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                   </div>
                      <table style="width:100%;">
                                 <tr>
                                     <td>&nbsp;</td>
                                     <td class="auto-style8">&nbsp;</td>
                                     <td>&nbsp;</td>
                                 </tr>
                                 <tr>
                                     <td>&nbsp;</td>
                                     <td class="auto-style8">&nbsp;</td>
                                     <td>
                                         <asp:Button ID="btnMateria" runat="server" Text="Registrar materias" OnClick="btnMateria_Click" Visible="False" />
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>&nbsp;</td>
                                     <td class="auto-style8">&nbsp;</td>
                                     <td>&nbsp;</td>
                                 </tr>
                             </table>
                  </asp:View>
             </asp:MultiView>
               </div>
            </form>
        </div> 
       
</asp:Content>
