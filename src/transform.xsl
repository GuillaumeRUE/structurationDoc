<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:excerpt="http://wordpress.org/export/1.2/excerpt/"
	xmlns:content="http://purl.org/rss/1.0/modules/content/"
	xmlns:wfw="http://wellformedweb.org/CommentAPI/"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:wp="http://wordpress.org/export/1.2/">
	<xsl:output method="xml" indent="yes" />

	<xsl:variable name="URL" select='"http://localhost/wordpress"'/>
	<xsl:variable name="login" select='"root"'/>

	<xsl:template match="/">
		<rss>
			<xsl:attribute name="version">2.0</xsl:attribute>
			<xsl:apply-templates select="root" />
		</rss>
	</xsl:template>
	<xsl:template match="root">
		<channel>
			<title>
				<xsl:value-of select="blog/name" />
			</title>
			<link><xsl:copy-of select="$URL"/></link>
			<description>
				<xsl:value-of select="blog/description" />
			</description>
			<pubDate>
				<xsl:value-of select="blog/created_at" />
			</pubDate>
			<language>
				fr-FR
			</language>
			<wp:wxr_version>1.2</wp:wxr_version>
			<wp:base_site_url><xsl:copy-of select="$URL"/></wp:base_site_url>
			<wp:base_blog_url><xsl:copy-of select="$URL"/></wp:base_blog_url>

			<generator>https://wordpress.org/?v=5.1.1</generator>

			<xsl:for-each select="posts/post">
				<item>
					<title><xsl:value-of select="title" /></title>
					<link><xsl:copy-of select="$URL"/>/<xsl:value-of select="substring(slug,1,string-length(slug)-5)" /></link>
					<pubDate><xsl:value-of select="published_at" /></pubDate>
					<dc:creator></dc:creator>
					<content:encoded>
					
						<xsl:value-of select="content" />
						
					</content:encoded>
				</item>
			</xsl:for-each>

		</channel>

	</xsl:template>




</xsl:stylesheet>