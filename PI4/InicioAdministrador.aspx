<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="InicioAdministrador.aspx.cs" Inherits="PI4.InicioAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
            <div class="page-header">
              <h1 class="all-tittles">Sistema Generador de Horarios <small>Inicio</small></h1>
            </div>
     </div>
   <section class="full-reset text-center" style="padding: 40px 0;">
            <article class="tile">
                <div class="tile-icon full-reset"><i class="zmdi zmdi-face"></i></div>
                <div class="tile-name all-tittles">administradores</div>
                <div class="tile-num full-reset">
                    <asp:Label ID="labelAdministradores" runat="server" Text="1"></asp:Label></div>
            </article>
            <article class="tile">
                <div class="tile-icon full-reset"><i class="zmdi zmdi-accounts"></i></div>
                <div class="tile-name all-tittles">estudiantes</div>
                <div class="tile-num full-reset">
                    <asp:Label ID="LabelEstudiante" runat="server" Text="Label"></asp:Label></div>
            </article>
            <article class="tile">
                <div class="tile-icon full-reset"><i class="zmdi zmdi-male-alt"></i></div>
                <div class="tile-name all-tittles">docentes</div>
                <div class="tile-num full-reset">
                    <asp:Label ID="LabelNumerodeDocentes" runat="server" Text="Label"></asp:Label>
                </div>
            </article>
            <article class="tile">
                <div class="tile-icon full-reset"><i class="zmdi zmdi-trending-up"></i></div>
                <div class="tile-name all-tittles" style="width: 90%;">Solicitudes</div>
                <div class="tile-num full-reset">&nbsp;
                    <asp:Label ID="LabelSolicitudes" runat="server" Text="Label"></asp:Label>
                </div>
             </article>
        </section>

</asp:Content>
