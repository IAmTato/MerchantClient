package org.directwebremoting;

import org.directwebremoting.servlet.InterfaceHandler;

public class AngularInterfaceHandler extends InterfaceHandler {
	/* (non-Javadoc)
     * @see org.directwebremoting.servlet.BaseInterfaceHandler#generateInterface(java.lang.String, java.lang.String)
     */
    @Override
    public String generateInterfaceScript(String contextPath, String servletPath, String scriptName)
    {
        StringBuilder buffer = new StringBuilder();

//        buffer
//            .append(EnginePrivate.getRequireEngineScript())
//            .append("\n");

        //"use strict";
        
        buffer.append("\"use strict\";\n");
        
        // An optimization here might be to only generate class
        // definitions for classes used as parameters in the class that we are
        // currently generating a proxy for.
        if (generateDtoClasses.matches(".*\\binterface\\b.*") && converterManager.getNamedConverterJavaScriptNames().size() > 0)
        {
            buffer
                .append(dtoAllHandler.generateDtoAllScript(contextPath, servletPath))
                .append("\n");
        }

        buffer
        	.append("angular.module(\"$dwr\")\n")
        	.append(".service(\""+scriptName+"\", [\"$dwr\", function (dwr) {\n")
        	.append("var p = this;\n")
            .append("(function () {\n")
            .append("  if (dwr.engine._getObject(\"" + scriptName + "\") == undefined) {\n")
            //.append("    var p;\n")
            .append("    \n")
            .append(remoter.generateInterfaceJavaScript(scriptName, "    ", "p", contextPath + servletPath))
            .append("    \n")
            .append("    dwr.engine._setObject(\"" + scriptName + "\", p);\n")
            .append("  }\n")
            .append("})();\n")
            .append("return p;\n")
        	.append("}]);\n");

        return buffer.toString();
    }
}
