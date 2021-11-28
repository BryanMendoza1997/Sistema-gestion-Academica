<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="Horarios.aspx.cs" Inherits="PI4.Horarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style10 {
            width: 235px;
        text-align: left;
    }
        .auto-style11 {
            width: 58px;
        }
        .auto-style15 {
            width: 191px;
        }
        .auto-style16 {
            width: 284px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid"  style="margin: 40px 0;">
            <div class="row">
                <div class="imagendiv">
                    <img src="assets/img/checklist.png" alt="pdf" class="imgCentrada" style="max-width: 110px;"/>
                </div>
                <div class="parrafo1">
                    <div class="pa1">
                      Binevenido a la Sección de Agregar Horarios. Para poder Agregar un Horario lea el manual de instruccion<br /> 
                      dando clic en Como subir el Archivo Exel.
                    </div>
                </div>
            </div>
        </div>
        <div>

            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Subir Archivo en Excel</asp:LinkButton><br /> 
            <asp:LinkButton ID="LinkButton2" runat="server">Como subir un Archivo en Excel</asp:LinkButton>
       </div>
        <div>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View3" runat="server">
                </asp:View>
                <asp:View ID="View2" runat="server">
                </asp:View>
                <asp:View ID="View1" runat="server">
                     <asp:ScriptManager ID="ScriptManager1"  EnablePartialRendering="true" runat="server"   >
                     </asp:ScriptManager>
                  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style10">

                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Text="Carrera:"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="ID_CARRERA" Width="214px" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT [ID_CARRERA], [NOMBRE] FROM [TB_CARRERA]"></asp:SqlDataSource>
                                <br />
                            </td>
                            <td>&nbsp;<asp:Label ID="Label3" runat="server" Text="Periodo:" Font-Bold="True" Font-Names="Arial Narrow"></asp:Label>
                                &nbsp; &nbsp;&nbsp;<asp:Label ID="Periodo" runat="server" Text="Label"></asp:Label>
                                &nbsp;<asp:DropDownList ID="DropDownList4" runat="server" Width="44px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                &nbsp;<asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Text="Semestre:"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="SEMESTRE" DataValueField="ID_SEMESTRE" Width="214px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT [ID_SEMESTRE], [SEMESTRE] FROM [TB_SEMESTRE]"></asp:SqlDataSource>
                                <br />
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Text="Paralelo:"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                &nbsp;<asp:DropDownList ID="DropDownList3" runat="server">
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>C</asp:ListItem>
                                    <asp:ListItem>D</asp:ListItem>
                                    <asp:ListItem>E</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                    <asp:ListItem>G</asp:ListItem>
                                    <asp:ListItem>H</asp:ListItem>
                                    <asp:ListItem>I</asp:ListItem>
                                    <asp:ListItem>J</asp:ListItem>
                                    <asp:ListItem>K</asp:ListItem>
                                    <asp:ListItem>R</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT TB_CURSOS.ID_CURSO,TB_CURSOS.CURSO FROM TB_CARRERA INNER JOIN TB_FACULTAD ON TB_CARRERA.ID_FACULTAD=TB_FACULTAD.ID_FACULTAD INNER JOIN TB_CURSOS ON TB_FACULTAD.ID_FACULTAD=TB_CURSOS.ID_FACULTAD WHERE ID_CARRERA=@ID_CARRERA">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="ID_CARRERA" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                   </ContentTemplate>
                  </asp:UpdatePanel>
                    <div>
 
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style15">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Text="Cargar Archivo en Excel:"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td class="auto-style16">
                                    <br />
                                    <asp:FileUpload ID="FileUpload1" runat="server" OnDataBinding="FileUpload1_DataBinding" OnInit="FileUpload1_Init" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label10" runat="server" Text="Label" Visible="False"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:ImageButton ID="Button2" runat="server" Height="26px" ImageUrl="~/Imagenes/new Document.png" OnClick="Button2_Click2" Visible="False" Width="35px" />
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Text="Hoja de exel a leer:&nbsp;&nbsp;&nbsp;"></asp:Label>
                                    <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" OnDataBinding="DropDownList5_DataBinding" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged" Width="121px">
                                    </asp:DropDownList>
                                    &nbsp;&nbsp; &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click3" Text="Detectar Hojas" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                <td class="auto-style16">
                                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                         <Triggers><asp:PostBackTrigger ControlID = "Button1" />
                             <asp:PostBackTrigger ControlID="Button2" />
                             <asp:PostBackTrigger ControlID="Button2" />
                             <asp:PostBackTrigger ControlID="Button2" />
                             <asp:PostBackTrigger ControlID="Button2" />
                             <asp:PostBackTrigger ControlID="Button2" />
                             <asp:PostBackTrigger ControlID="Button2" />
                        </Triggers>
                        <Triggers><asp:PostBackTrigger ControlID = "Button2" /></Triggers>
                  </asp:UpdatePanel>
                  
                    </div>
                      <div style="height: 1131px">
 <%--                         <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                             <ContentTemplate>--%>
                          <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                              <ContentTemplate>
                                <br />

                          &nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:Button ID="btnvisualizarhorario" runat="server" OnClick="Button1_Click" Text="Visualizar Horario" Width="143px" Visible="False" />
                          <br />
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:GridView ID="GridView1" runat="server" Width="569px">
                          </asp:GridView>
                           </ContentTemplate>
                               <Triggers>
                                         <asp:AsyncPostBackTrigger ControlID="btnvisualizarhorario" EventName="Click" />
                                </Triggers>
                          </asp:UpdatePanel>
                           <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                               <ContentTemplate>
                                <br />
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <asp:Button ID="btnvisualizarmaterias" runat="server" OnClick="Button2_Click" Text="Visualizar Materias" Visible="False" />
                                   <br />
                                   <br />
                                   &nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:GridView ID="GridView2" runat="server" Width="567px">
                              <Columns>
                                  <asp:TemplateField HeaderText="DOCENTE"><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></EditItemTemplate><ItemTemplate><asp:DropDownList ID="DropUsado" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="ID_DOCENTE" Width="181px"></asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDPI4ConnectionString %>" SelectCommand="SELECT TB_DOCENTE.ID_DOCENTE,RTRIM(TB_PERSONA.NOMBRES)+' '+LTRIM(TB_PERSONA.APELLIDOS) FROM TB_PERSONA INNER JOIN TB_DOCENTE ON TB_PERSONA.ID_PERSONA=TB_DOCENTE.ID_PERSONA"></asp:SqlDataSource></ItemTemplate></asp:TemplateField>
                              </Columns>
                          </asp:GridView>
                                   <br />
                                   <br />
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <asp:Button ID="btnguardarhorario" runat="server" OnClick="btnguardarhorario_Click" Text="Guardar Horario " Visible="False" />
                              </ContentTemplate>
                                <Triggers>
                                         <asp:PostBackTrigger ControlID="btnguardarhorario" />
                                         <asp:AsyncPostBackTrigger ControlID="btnvisualizarmaterias" EventName="Click" />
                                 </Triggers>

                          </asp:UpdatePanel>
                          <br />
                          <br />
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;</div>
<%--                      </ContentTemplate>
                  </asp:UpdatePanel>--%>
                          <div>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              </div>
                </asp:View>
            </asp:MultiView>
        </div>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

