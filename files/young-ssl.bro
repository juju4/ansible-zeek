## from http://ossectools.blogspot.ca/2011/08/monitoring-ssl-connections-with-bro.html
event SSL::log_ssl(rec: SSL::Info)
       {
       # We have to check if there is a not_valid_before field because not
       # all SSL transactions actually exchange certificates (i.e. resumed session).
       if ( rec?$not_valid_before && rec$not_valid_before >= network_time() - 30 days &&
            rec$not_valid_before <= network_time() )
               {
               print fmt("%s is using a certificate that just became valid in the last 30 days (%T) (%s)",
                       rec$id$resp_h, rec$not_valid_before, rec$subject);
               }
       }
