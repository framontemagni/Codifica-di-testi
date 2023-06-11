<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html"/>

    <xsl:template match="/">

        <html>

            <head>
                <title> Progetto di Codifica di testi - Francesca Montemagni </title>
                <meta charset="utf-8"/>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>

            <body>
                <div class="copertina">
                    <div>
                        <h1><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"></xsl:value-of></h1>
                        <h3><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition"></xsl:value-of><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt[1]"></xsl:value-of></h3>
                    </div>
                </div>

                <div class="informazioniGenerali">
                    
                    <div class="riassunto">
                        <p><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:summary"/></p> 
                    </div>
                    
                    <div class="descrizioneBibliografica">
                        <div class="bottoniInformazione">
                            <button class="bottoneInfo" onclick="mostraInformazioni('contenitoreIdentificazione', 'contenitoreContenuti', 'descrizioneFisica')"> IDENTIFICAZIONE </button>
                            <button class="bottoneInfo" onclick="mostraInformazioni('contenitoreContenuti', 'contenitoreIdentificazione', 'descrizioneFisica')"> CONTENUTI </button>
                            <button class="bottoneInfo" onclick="mostraInformazioni('descrizioneFisica', 'contenitoreContenuti', 'contenitoreIdentificazione')"> DESCRIZIONE FISICA </button>
                        </div>
                        <div id="contenitoreDescrizione">
                            <div id="contenitoreIdentificazione">
                                <xsl:apply-templates select="//tei:msIdentifier"/>
                            </div>
                            <div id="contenitoreContenuti">
                                <xsl:apply-templates select="//tei:msContents"/>
                            </div>
                            <div id="descrizioneFisica">
                                <xsl:apply-templates select="//tei:physDesc"/>
                            </div>
                        </div>
                    </div>

                    <div class="storia">
                        <p><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:history/tei:origin"/></p>
                    </div>
                </div>

                <div class="principale">

                    <div class="divCambioPagina">
                        <h2 id="numeroPagina"></h2>
                        <div id="bottoniPag">
                            <button onclick="cambioPagina(-1)"> &#10094;</button>
                            <button onclick="cambioPagina(1)">&#10095;</button>
                        </div>
                    </div>

                    <xsl:apply-templates select="tei:TEI/tei:facsimile"/>

                    <div class="divCambioPagina">
                        <div id="bottoniPag">
                            <button onclick="cambioPagina(-1)"> &#10094;</button>
                            <button onclick="cambioPagina(1)">&#10095;</button>
                        </div>
                    </div>

                    <div class="divBottoni">
                        <div class="mostra">
                            <button id="bottoneExpan" onclick="mostra('expan', '#ffdb4d', 'bottoneExpan')"> ESPANSIONI </button>
                            <button id="bottoneCorr" onclick="mostra('corr', '#e60000', 'bottoneCorr')"> CORREZIONI </button>
                            <button id="bottoneDel" onclick="mostra('del', '#ff0066', 'bottoneDel')"> CANCELLATURE </button>
                            <button id="bottoneSupplied" onclick="mostra('supplied', '#ff6633', 'bottoneSupplied')"> AGGIUNTE EDITORIALI </button>
                            <button id="bottoneAdd" onclick="mostra('add', '#00b8e6', 'bottoneAdd')"> AGGIUNTE DELL'AUTORE </button>
                            <button id="bottoneForeign" onclick="mostra('foreign', '#9999ff', 'bottoneForeign')"> PAROLE STRANIERE </button>
                            <button id="bottoneUnclear" onclick="mostra('unclear', '#00b300', 'bottoneUnclear')"> TESTO POCO LEGGIBILE </button>
                            <button id="bottoneDate" onclick="mostra('date', '#006600', 'bottoneDate')"> DATE </button>
                        </div>
                    </div>
                </div>
                
                <div class="back">

                    <div class="persone">
                        <div id="contenitorePersone">
                            <xsl:apply-templates select="//tei:listPerson"/>
                        </div>
                    </div>

                    <div class="luoghi">
                        <div id="contenitoreLuoghi">
                            <xsl:apply-templates select="//tei:listPlace"/>                           
                         </div>
                    </div>

                    <div class="organizzazioni">
                        <div id="contenitoreOrganizzazioni">
                            <xsl:apply-templates select="//tei:listOrg"/>
                        </div>
                    </div>

                </div>

                <div class="fine">
                    
                    <div class="bibliografia">
                        <div id="contenitoreBibliografia">
                             <xsl:apply-templates select="//tei:listBibl"/>
                        </div>
                    </div>
                </div>

                <footer>
                    <h1>Sul progetto</h1>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:notesStmt"/>.<br/>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:projectDesc"/>.<br/>
                    <h3>Francesca Montemagni</h3>
                </footer>

                
            </body>

            <script type="text/javascript" src="script.js"></script>

        </html>
    </xsl:template>

    <xsl:template match="tei:msIdentifier">
        <h4 id="identificazione">Identificazione</h4>
        <table id="tableIdentificazione">
            <tr>
                <th><strong>Posizione:</strong> </th>
                <th><span><xsl:value-of select="//tei:msIdentifier/tei:settlement"/></span>, <span><xsl:value-of select="//tei:msIdentifier/tei:country"/></span></th>
            </tr>
            <tr>
                <th><strong>Istituzione responsabile:</strong> </th>
                <th><span><xsl:value-of select="//tei:msIdentifier/tei:institution"/></span></th>
            </tr>
            <tr>
                <th><strong>Collezione:</strong> </th>
                <th><span><xsl:value-of select="//tei:msIdentifier/tei:collection"/></span></th>
            </tr>
            <tr>
                <th><strong>Manoscritto:</strong> </th>
                <th><span><xsl:value-of select="//tei:msIdentifier/tei:idno"/></span></th>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:msContents">
        <h4 id="contenuti">Contenuti</h4>
        <ul id="tableContenuti">
            <li><span><xsl:value-of select="//tei:msContents/tei:msItem[@n=1]/tei:title"/></span></li>
            <li><xsl:value-of select="//tei:msContents/tei:msItem[@n=1]/tei:author"/></li>
            <li><span>Lingua: <xsl:value-of select="//tei:msContents/tei:msItem[@n=1]/tei:textLang"/></span></li>
        </ul>
        <ul id="tableContenuti">
            <li><span><xsl:value-of select="//tei:msContents/tei:msItem[@n=2]/tei:title"/></span></li>
            <li><xsl:value-of select="//tei:msContents/tei:msItem[@n=2]/tei:author"/></li>
            <li><span>Lingua: <xsl:value-of select="//tei:msContents/tei:msItem[@n=2]/tei:textLang"/></span></li>
        </ul>
    </xsl:template>

    <xsl:template match="tei:physDesc">
        <h4 id="descrizioneFisicaTitolo">Descrizione fisica</h4>
        <table id="fisica">
            <tr><th><strong>Supporto:</strong> </th></tr>
            <tr><th><span><xsl:value-of select="//tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support"/></span></th></tr>
            <tr><th><strong>Composizione: </strong> </th></tr>
            <tr><th><span><xsl:value-of select="//tei:physDesc/tei:objectDesc/tei:supportDesc/tei:extent"/></span></th></tr>
            <tr><th><strong>Condizioni fisiche:</strong> </th></tr>
            <tr><th><span><xsl:value-of select="//tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition"/></span></th></tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:facsimile">
        <xsl:for-each select="tei:surface">
            <div class="pp">
                <xsl:element name="img">
                    <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"></xsl:value-of></xsl:attribute>
                    <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id"></xsl:value-of></xsl:attribute>
                    <xsl:attribute name="alt">pagina<xsl:value-of select="@xml:id"></xsl:value-of></xsl:attribute>
                </xsl:element>

                <xsl:element name="map">
                    <xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute>
                    <xsl:for-each select="tei:zone">
                        <xsl:element name="area">
                            <xsl:attribute name="onmouseover">segnalaRiga(this, "on")</xsl:attribute>
                            <xsl:attribute name="onmouseout">segnalaRiga(this, "off")</xsl:attribute>
                            <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                            <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            

                <div class="trascrizione">
                    <p>
                        <!-- Per ogni immagine, mostra la trascrizione della pagina visualizzata e non delle altre (errori, modifiche, interventi sono inclusi).-->
                        <xsl:variable name="segnaposto" >
                            <xsl:value-of select="position()"/>
                        </xsl:variable>
                        <xsl:apply-templates select="//tei:ab[@n=$segnaposto]"/>
                    </p>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:lb">
        <xsl:element name="br"/>
        <!-- Inserimento del numero di linea -->
        <xsl:element name="span">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="class"></xsl:attribute>
            <xsl:value-of select="@n" />
        </xsl:element>
    </xsl:template>

    <!-- Abbreviazioni-->
    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Espansioni -->
    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Errori -->
    <xsl:template match="tei:sic">
        <xsl:element name="span">
            <xsl:attribute name="class">sic</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Correzioni -->
    <xsl:template match="tei:corr">
        <xsl:element name="span">
            <xsl:attribute name="class">corr</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Aggiunte -->
    <xsl:template match="tei:add">
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Testo cancellato -->
    <xsl:template match="tei:del">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Parole straniere -->
    <xsl:template match="tei:foreign">
        <xsl:element name="span">
            <xsl:attribute name="class"> foreign </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Testo poco leggibile -->
    <xsl:template match="tei:unclear">
        <xsl:element name="span">
            <xsl:attribute name="class"> unclear </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Aggiunte editoriali -->
    <xsl:template match="tei:supplied">
        <xsl:element name="span">
            <xsl:attribute name="class"> supplied </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Date -->
    <xsl:template match="tei:date">
        <xsl:element name="span">
            <xsl:attribute name="class"> date </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:listPerson">
        <h2><xsl:value-of select="tei:head"/></h2>
        <xsl:for-each select="tei:person">
            <ul>
                <li>
                    <xsl:value-of select="tei:persName/tei:forename"/><xsl:value-of select="tei:persName/tei:surname"/> (<xsl:value-of select="tei:sex/@value"/>)<br/>
                    <xsl:if test="tei:persName/tei:addName">
                        <xsl:value-of select="tei:persName/tei:note"/><br/>
                    </xsl:if>
                    <xsl:value-of select="tei:birth/tei:placeName/tei:settlement"/>, <xsl:value-of select="tei:birth/tei:date"/> - <xsl:value-of select="tei:death/tei:placeName/tei:settlement"/>,<xsl:value-of select="tei:death/tei:date"/><br/>
                </li>
            </ul>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:listPlace">
        <h2><xsl:value-of select="tei:head"/></h2>
        <xsl:for-each select="tei:place">
            <ul>
                <li>
                    <xsl:value-of select="tei:placeName"/>
                    (provincia di <xsl:value-of select="tei:settlement[@type='province']"/>),
                    <xsl:value-of select="tei:region"/>,
                    <xsl:value-of select="tei:country"/>.
                </li>
            </ul>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:listOrg">
        <h2><xsl:value-of select="tei:head"/></h2>
        <xsl:for-each select="tei:org">
            <ul>
                <li>
                    <xsl:value-of select="tei:orgName"/><br/>
                    <xsl:value-of select="tei:desc"/>
                </li>
            </ul>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:listBibl">
        <h2><xsl:value-of select="tei:head"/></h2>
        <xsl:for-each select="tei:biblStruct">
            <ul>
                <li>
                    <xsl:value-of select="tei:monogr/tei:title"/>,
                    <xsl:value-of select="tei:monogr/tei:author"/>.
                    <xsl:value-of select="tei:monogr/tei:respStmt"/>,
                    <xsl:value-of select="tei:monogr/tei:imprint"/>.
                </li>
            </ul>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>