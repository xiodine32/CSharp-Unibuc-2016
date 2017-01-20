using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

/// <summary>
/// Summary description for Identity
/// </summary>
public static class IdentityExtender
{
    public static bool ExtendsRole(this IPrincipal principal, string role)
    {
        if (!principal.Identity.IsAuthenticated)
            return false;

        if (principal.IsInRole(Administrator))
            return true;

        if (principal.IsInRole(Editor) && role == Editor)
            return true;

        return role == Normal;
    }

    // Anonymous < Normal < Editor < Administrator
    public static string Normal { get; } = nameof(Normal);
    public static string Editor { get; } = nameof(Editor);
    public static string Administrator { get; } = nameof(Administrator); 
}