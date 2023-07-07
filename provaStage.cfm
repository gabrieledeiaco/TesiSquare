<cfoutput>
  <form name="myForm" id="myForm" method="post" target="_self">
    <input type="text" name="nome" id="Campo 1" placeholder="Inserisci nome">
    <input type="text" name="cogn" id="Campo 2" placeholder=nserisci luogo di residenza">
    <input type="text" name="prof" id="Campo 7" placeholder="Inseris"Inserisci cognome">
    <input type="text" name="sesso" id="Campo 3" placeholder="Inserisci sesso">
    <input type="text" name="dataNasc" id="Campo 4" placeholder="Inserisci data di nascita">
    <input type="text" name="luogoNasc" id="Campo 5" placeholder="Inserisci luogo di nascita">
    <input type="text" name="luogoRes" id="Campo 6" placeholder="Ici professione"><br><br>
     
    <input type="submit" name="submitBtn" value="Invia">
    <input type="reset" name="campoRes" value="Resetta">
  </form>

 <cfquery name="table_query" datasource="#application.glb.dbprop.dsn#">
    SELECT nome, cogn, sesso, dataNasc, luogoNasc, luogoRes, prof, id
    FROM People
  </cfquery>

  <cfif structKeyExists(form, "nome") and len(trim(form.nome)) and len(trim(form.cogn)) and len(trim(form.sesso)) and len(trim(form.dataNasc)) and len(trim(form.luogoNasc)) and len(trim(form.luogoRes)) and len(trim(form.prof)) gt 0 >
    <cfquery name="nome_query" datasource="#application.glb.dbprop.dsn#">
      INSERT INTO People (nome, cogn, sesso, dataNasc, luogoNasc, luogoRes, prof)
      VALUES ('#form.nome#', '#form.cogn#', '#form.sesso#', '#form.dataNasc#','#form.luogoNasc#','#form.luogoRes#','#form.prof#');
    </cfquery>
  <cfelse>
    <cfmessagebox type="alert" message="Inserisci tutti i dati" name="errMess">
  </cfif>

  <cfif structKeyExists(form, 'modId') and len(trim(form.modId)) gt 0>
    <cfquery name="change_query" datasource="#application.glb.dbprop.dsn#">
      SET ANSI_WARNINGS OFF;
      UPDATE People 
      SET nome = '#modInputn#', cogn = '#modInputc#', sesso = '#modInputs#', dataNasc='#modInputdn#', luogoNasc = '#modInputln#', luogoRes = '#modInputlr#', prof = '#modInputp#' 
      WHERE id = #form.modId#;
    </cfquery>
  </cfif>

    <cfif structKeyExists(form, 'modId') and len(trim(form.modId)) gt 0>
    <cfquery name="delete_query" datasource="#application.glb.dbprop.dsn#">
      DELETE FROM People WHERE id = #form.modId#
    </cfquery>
  </cfif>

  <cfif structKeyExists(form, 'modId') and len(trim(form.modId)) gt 0>
    <cfquery name="add_query" datasource="#application.glb.dbprop.dsn#">
      ALTER TABLE People
      ADD gugugaga varchar(100);
    </cfquery>
  </cfif>

<div class="table-container">

<form name="modForm" id="modForm" method="post" target="_self">

  <table>
    <thead>
      <tr>
        <th>Nome</th>
        <th>Cognome</th>
        <th>Sesso</th>
        <th>Data<br>nascita</th>
        <th>Luogo<br>nascita</th>
        <th>Luogo<br>residenza</th>
        <th>Professione</th>
        <th>ID</th>
        <th>Azioni</th>
      </tr>
    </thead>
      <input type="hidden" name="modId" id="modId" value=""> 
    <tbody>
      <cfloop query="table_query">
        <tr>
          <td><input type="text" id="modInputn" name="modInputn" value="#table_query.nome#"></td>
          <td><input type="text" id="modInputc" name="modInputc" value="#table_query.cogn#"></td>
          <td><input type="text" id="modInputs" name="modInputs" value="#table_query.sesso#"></td>
          <td><input type="text" id="modInpudn" name="modInputdn" value="#table_query.dataNasc#"></td>
          <td><input type="text" id="modInpuln" name="modInputln" value="#table_query.luogoNasc#"></td>
          <td> <input type="text" id="modInpulr" name="modInputlr" value="#table_query.luogoRes#"></td>
          <td><input type="text" id="modInputp" name="modInputp" value="#table_query.prof#"></td>
          <td>#table_query.id#</td>
          <td>          
              <input type="button" onclick="modifica(#table_query.id#)" name="changeBtn" value="Mod">  <br>
              <input type="button" onclick="elimina(#table_query.id#)" name="deleteBtn" value="X">
              <input type="button" onclick="aggColonna(#table_query.id#)" name="addColBtn" value="+">

          </td>
        </tr>
      </cfloop>
    </tbody>
  </table>
 </form>
</div>


</cfoutput>

<cfoutput>
  <html>
   <head>
    <style>
       body {
        font-family: Verdana;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: rgb(245,208,66);
      }
      table {
        border-collapse: collapse;
        width: 100%; 
        color: rgb(10, 23, 78);
        table-layout: fixed; 
        text-align: center;
      }
      th, td {
        border: 1px solid black;
        padding: 8px;
        white-space: nowrap; 
        overflow: hidden; 
        text-overflow: ellipsis;
        text-align: center;
      }
      th {
        background-color: rgb(10,23,78);
        color: rgb(245,208,66);
        height: 50px;
        text-align: center;
      }
      input[type="text"] {
        padding: 5px;
        margin: 1px;
        margin.top: 30px;
        width: 70%;
        float: center;
        border: solid black 2px;
        text-align: center;
      }
      input[type="submit"], input[type="reset"] {
        padding: 5px 10px;
        background-color: rgb(10,23,78);
        color: white;
        border: none;
        cursor: pointer;
        width: 60px;
        height: 40px;
        margin-top: 1px;
        margin-left: 12px;
        text-align: center;
      }
      input[type="submit"]:hover, input[type="reset"]:hover {
        background-color: rgb(10,23,78);
        text-align: center;
      }
      input[name="deleteBtn"], input[name="changeBtn"] {
        background-color: rgb(10,23,78);
        text-align: center;
        width:40px;
        height:40px;
        color:rgb(245,208,66);
        margin-bottom:1px;
      }
      input[name="deleteBtn"]:hover, input[name="changeBtn"] {
        background-color: rgb(10,23,78);
        float: center;
        text-align: center;
      }
      .table-container {
        max-height: 500px; 
        overflow-y: scroll;
        width: 550%; 
        text-align: center;
      }
    </style>
   </head>
  <body>

<script>
  function elimina(id){
    document.getElementById("modId").value=id;
    document.getElementById('modForm').submit();
  }

  function modifica(id){
    document.getElementById("modId").value=id;
    document.getElementById('modForm').submit();
  }

  function aggColonna(id){
    document.getElementById("modId").value=id;
    document.getElementById('modForm').submit();
  }
</script>

    </body>
  </html>
</cfoutput>

