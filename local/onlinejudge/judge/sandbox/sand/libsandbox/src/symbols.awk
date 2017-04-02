################################################################################
# Sandbox Library Source File (symbols.c) Generator Script                     #
#                                                                              #
# Copyright (C) 2004-2009 LIU Yu, pineapple.liu@gmail.com                      #
# All rights reserved.                                                         #
#                                                                              #
# Redistribution and use in source and binary forms, with or without           #
# modification, are permitted provided that the following conditions are met:  #
#                                                                              #
# 1. Redistributions of source code must retain the above copyright notice,    #
#    this list of conditions and the following disclaimer.                     #
#                                                                              #
# 2. Redistributions in binary form must reproduce the above copyright notice, #
#    this list of conditions and the following disclaimer in the documentation #
#    and/or other materials provided with the distribution.                    #
#                                                                              #
# 3. Neither the name of the author(s) nor the names of its contributors may   #
#    be used to endorse or promote products derived from this software         #
#    without specific prior written permission.                                #
#                                                                              #
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"  #
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE    #
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE   #
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE     #
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR          #
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF         #
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS     #
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN      #
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)      #
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE   #
# POSSIBILITY OF SUCH DAMAGE.                                                  #
################################################################################

BEGIN {
    print "/*******************************************************************************"
    print " * Copyright (C) 2004-2009 LIU Yu, pineapple.liu@gmail.com                     *"
    print " * All rights reserved.                                                        *"
    print " *                                                                             *"
    print " * Redistribution and use in source and binary forms, with or without          *"
    print " * modification, are permitted provided that the following conditions are met: *"
    print " *                                                                             *"
    print " * 1. Redistributions of source code must retain the above copyright notice,   *"
    print " *    this list of conditions and the following disclaimer.                    *"
    print " *                                                                             *"
    print " * 2. Redistributions in binary form must reproduce the above copyright        *"
    print " *    notice, this list of conditions and the following disclaimer in the      *"
    print " *    documentation and/or other materials provided with the distribution.     *"
    print " *                                                                             *"
    print " * 3. Neither the name of the author(s) nor the names of its contributors may  *"
    print " *    be used to endorse or promote products derived from this software        *"
    print " *    without specific prior written permission.                               *"
    print " *                                                                             *"
    print " * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\" *"
    print " * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE   *"
    print " * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE  *"
    print " * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE    *"
    print " * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR         *"
    print " * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF        *"
    print " * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS    *"
    print " * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN     *"
    print " * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)     *"
    print " * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE  *"
    print " * POSSIBILITY OF SUCH DAMAGE.                                                 *"
    print " ******************************************************************************/"
    print "/*"
    print " * This file was automatically generated with \"symbols.awk\""
    print " */"
    print ""
    print "#include \"symbols.h\""
    print ""
    print "#ifndef NDEBUG"
    print ""
	    
    nevent = 0
    ievent = 0;    
    naction = 0;
    iaction = 0;
    nstatus = 0;
    istatus = 0;
    nresult = 0;
    iresult = 0;
}
/^[[:space:]]*S_EVENT_[[:upper:]]+[[:space:]]+=[[:space:]]+[[:digit:]+][.]*/ {
    ievent = sprintf("%d", $3);
    if (nevent <= ievent) 
    	nevent = ievent + 1;
    eventlist[ievent] = sprintf("%s", substr($1, 9, 16));
}
/^[[:space:]]*S_ACTION_[[:upper:]]+[[:space:]]+=[[:space:]]+[[:digit:]+][.]*/ {
    iaction = sprintf("%d", $3);
    if (naction <= iaction) 
    	naction = iaction + 1;
    actionlist[iaction] = sprintf("%s", substr($1, 10, 16));
}
/^[[:space:]]*S_STATUS_[[:upper:]]+[[:space:]]+=[[:space:]]+[[:digit:]+][.]*/ {
    istatus = sprintf("%d", $3);
    if (nstatus <= istatus) 
    	nstatus = istatus + 1;
    statuslist[istatus] = sprintf("%s", substr($1, 10, 16));
}
/^[[:space:]]*S_RESULT_[[:upper:]]+[[:space:]]+=[[:space:]]+[[:digit:]+][.]*/ {
    iresult = sprintf("%d", $3);
    if (nresult <= iresult) 
    	nresult = iresult + 1;
    resultlist[iresult] = sprintf("%s", substr($1, 10, 16));
}
END {
    print "const char *"
    print "s_event_type_name(int event)"
    print "{"
    print "    static const char * table[] = "
    print "    {"
    for (n = 0; n < nevent; n++)
    {
        if (eventlist[n] != "")
            printf("        \"%s\", /* %d */\n", eventlist[n], n);
       	else
            printf("        \"N/A\", /* %d */\n", n);
    }
    print "    };"
    print "    return table[event];"
    print "}"
    print ""

    print "const char *"
    print "s_action_type_name(int action)"
    print "{"
    print "    static const char * table[] = "
    print "    {"
    for (n = 0; n < naction; n++)
    {
        if (actionlist[n] != "")
            printf("        \"%s\", /* %d */\n", actionlist[n], n);
       	else
       	    printf("        \"N/A\", /* %d */\n", n);
    }
    print "    };"
    print "    return table[action];"
    print "}"
    print ""
	
    print "const char *"
    print "s_status_name(int status)"
    print "{"
    print "    static const char * table[] = "
    print "    {"
    for (n = 0; n < nstatus; n++)
    {
        if (statuslist[n] != "")
            printf("        \"%s\", /* %d */\n", statuslist[n], n);
       	else
       	    printf("        \"N/A\", /* %d */\n", n);
    }
    print "    };"
    print "    return table[status];"
    print "}"
    print ""
	
    print "const char *"
    print "s_result_name(int result)"
    print "{"
    print "    static const char * table[] = "
    print "    {"
    for (n = 0; n < nresult; n++)
    {
        if (resultlist[n] != "")
            printf("        \"%s\", /* %d */\n", resultlist[n], n);
       	else
            printf("        \"N/A\", /* %d */\n", n);
    }
    print "    };"
    print "    return table[result];"
    print "}"
    print ""
    print "#endif /* !defined NDEBUG */"
}
