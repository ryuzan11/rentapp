$("#renthouse-<%= renthouse.id %>.like").html("<%= escape_javascript(render "likes/like", renthouse: @renthouse) %>");
