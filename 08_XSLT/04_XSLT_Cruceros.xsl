<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Nos situamos en el nodo raiz -->
	<xsl:template match="/">	
		<html>
		<head>
		<title>Cruceros</title>
		</head>
		<body>
			<h1 style="color:red">Ejemplos de uso de expresiones XPATH</h1>
			<!-- Busqueda absoluta de un detalle de un crucero 
				Por defecto, si lo ponemos dentro de un "value-of" para pintarlo
				solo nos pintaría el primer nodo, por lo que tenemos que iterarlo
				Pero OJO, si usaramos un motor de XPATH veriamos que efectivamente
				nos devuelve todos los nodos
			-->
			<xsl:value-of select="/cruceros/crucero/detalles" />
			<hr/>
			<!-- Vamos a iterarlo para ver que efectivamente podemos acceder a todos 
			los nodos detalle-->
			<xsl:for-each select="/cruceros/crucero/detalles">
				<!-- Accedemos de manera relativa a los valores de dentro del detalle -->
				<xsl:value-of select="cia" /> - 
				<xsl:value-of select="dias" /> - 
				<xsl:value-of select="fechaSalida" />
				<br/>
			</xsl:for-each>
			<hr/>

			<!-- Busqueda relativa de un detalle de un crucero, no empieza por "/" por lo que las 
			busquedas son relativas al nodo que nos encontramos, en este caso en el nodo raiz que 
			hemos puesto en la linea 4
			 -->
			<xsl:value-of select="cruceros/crucero/detalles" />
			<hr/>

			<!--
				Todos los cruceros de manera absoluta
				Mismo caso que el primero (como todos los ejemplos de este xsl), solo se muestra
				el primer caso que coincida, debermos iterarlo con un for-each para sacarlos todos
			-->
			<xsl:value-of select="/cruceros/crucero" />
			<hr/>

			<!--
				Todas las etiquetas informacion, no importa donde estén en el documento XML.
				Como tenemos muchas etiquetas información, lo mejor es iterarlas
			-->
			<xsl:for-each select="//informacion">
				<!-- 
					Como queremos acceder a la propia información de manera relativa del nodo 
					que estamos iterando debemos de poner un "." ( como "this" en java)
				-->
				<xsl:value-of select="." /> - 
			</xsl:for-each>
			<hr/>

			<!--
				Todos los atributos "codigo" de los cruceros
			-->
			<xsl:value-of select="/cruceros/crucero/@codigo" />
			<hr/>

			<!--
				Solo el primer crucero, usamos predicados
			-->
			<xsl:value-of select="/cruceros/crucero[1]" />
			<hr/>

			<!--
				Solo el ultimo crucero
			-->
			<xsl:value-of select="/cruceros/crucero[last()]" />
			<hr/>

			<!--
				Solo los dias del primer crucero
			-->
			<xsl:value-of select="/cruceros/crucero[1]/detalles/dias" />

			<!-- OJO, /cruceros/crucero/detalles/dias[1], esto nos sacaria todos los dias
				de todos los cruceros, porque solo hacemos filtro por el atributo dia.
				Es decir, de todas las etiquetas dias que tenga detalles, solo me sacaria la 
				primera.
			-->
			<hr/>

			<!--
				Solo la escala que tenga un atributo dia cuyo valor sea 3
			-->
			<xsl:value-of select="/cruceros/crucero/escalas/escala[@dia=3]" />
			<hr/>

			<!--
				Los cruceros que tengo una escala cuyo atributo dia sea 3
			-->
			<xsl:value-of select="/cruceros/crucero[escalas/escala/@dia=3]" />
			<!-- Notese que siempre se muestra el ultimo nodo de la consulta xpath, dentro de
				los "[]" irian las condiciones (predicados)
			-->
			<hr/>

			<!--
				Los cruceros que tengan una duracion de 7 días
			-->
			<xsl:value-of select="/cruceros/crucero[detalles/dias=7]" />
			<hr/>
		</body>
		</html>
		
	</xsl:template>
</xsl:stylesheet>