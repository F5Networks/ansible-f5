.. _bigip_gtm_wide_ip:


bigip_gtm_wide_ip - Manages F5 BIG-IP GTM wide ip
+++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.0


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* Manages F5 BIG-IP GTM wide ip.


Requirements (on host that executes module)
-------------------------------------------

  * f5-sdk


Options
-------

.. raw:: html

    <table border=1 cellpadding=4>
    <tr>
    <th class="head">parameter</th>
    <th class="head">required</th>
    <th class="head">default</th>
    <th class="head">choices</th>
    <th class="head">comments</th>
    </tr>
                <tr><td>name<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>Wide IP name. This name must be formatted as a fully qualified domain name (FQDN). You can also use the alias <code>wide_ip</code> but this is deprecated and will be removed in a future Ansible version.</div></br>
    <div style="font-size: small;">aliases: wide_ip<div>        </td></tr>
                <tr><td>partition<br/><div style="font-size: small;"> (added in 2.5)</div></td>
    <td>no</td>
    <td>Common</td>
        <td></td>
        <td><div>Device partition to manage resources on.</div>        </td></tr>
                <tr><td>pool_lb_method<br/><div style="font-size: small;"> (added in 2.5)</div></td>
    <td>yes</td>
    <td></td>
        <td><ul><li>round-robin</li><li>ratio</li><li>topology</li><li>global-availability</li></ul></td>
        <td><div>Specifies the load balancing method used to select a pool in this wide IP. This setting is relevant only when multiple pools are configured for a wide IP.</div></br>
    <div style="font-size: small;">aliases: lb_method<div>        </td></tr>
                <tr><td rowspan="2">pools<br/><div style="font-size: small;"> (added in 2.5)</div></td>
    <td>no</td>
    <td></td><td></td>
    <td> <div>The pools that you want associated with the Wide IP.</div><div>If <code>ratio</code> is not provided when creating a new Wide IP, it will default to 1.</div>    </tr>
    <tr>
    <td colspan="5">
    <table border=1 cellpadding=4>
    <caption><b>Dictionary object pools</b></caption>
    <tr>
    <th class="head">parameter</th>
    <th class="head">required</th>
    <th class="head">default</th>
    <th class="head">choices</th>
    <th class="head">comments</th>
    </tr>
                    <tr><td>ratio<br/><div style="font-size: small;"></div></td>
        <td>no</td>
        <td></td>
                <td></td>
                <td><div>Ratio for the pool.</div><div>The system uses this number with the Ratio load balancing method.</div>        </td></tr>
                    <tr><td>name<br/><div style="font-size: small;"></div></td>
        <td>yes</td>
        <td></td>
                <td></td>
                <td><div>The name of the pool to include</div>        </td></tr>
        </table>
    </td>
    </tr>
        </td></tr>
                <tr><td>state<br/><div style="font-size: small;"> (added in 2.4)</div></td>
    <td>no</td>
    <td>present</td>
        <td><ul><li>present</li><li>absent</li><li>disabled</li><li>enabled</li></ul></td>
        <td><div>When <code>present</code> or <code>enabled</code>, ensures that the Wide IP exists and is enabled.</div><div>When <code>absent</code>, ensures that the Wide IP has been removed.</div><div>When <code>disabled</code>, ensures that the Wide IP exists and is disabled.</div>        </td></tr>
                <tr><td>type<br/><div style="font-size: small;"> (added in 2.4)</div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>a</li><li>aaaa</li><li>cname</li><li>mx</li><li>naptr</li><li>srv</li></ul></td>
        <td><div>Specifies the type of wide IP. GTM wide IPs need to be keyed by query type in addition to name, since pool members need different attributes depending on the response RDATA they are meant to supply. This value is required if you are using BIG-IP versions &gt;= 12.0.0.</div>        </td></tr>
        </table>
    </br>



Examples
--------

 ::

    
    - name: Set lb method
      bigip_gtm_wide_ip:
        server: lb.mydomain.com
        user: admin
        password: secret
        lb_method: round-robin
        name: my-wide-ip.example.com
      delegate_to: localhost


Return Values
-------------

Common return values are `documented here <http://docs.ansible.com/ansible/latest/common_return_values.html>`_, the following are the fields unique to this module:

.. raw:: html

    <table border=1 cellpadding=4>
    <tr>
    <th class="head">name</th>
    <th class="head">description</th>
    <th class="head">returned</th>
    <th class="head">type</th>
    <th class="head">sample</th>
    </tr>

        <tr>
        <td> state </td>
        <td> The new state of the wide IP. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> disabled </td>
    </tr>
            <tr>
        <td> lb_method </td>
        <td> The new load balancing method used by the wide IP. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> topology </td>
    </tr>
        
    </table>
    </br></br>

Notes
-----

.. note::
    - Requires the f5-sdk Python package on the host. This is as easy as pip install f5-sdk.
    - For more information on using Ansible to manage F5 Networks devices see https://www.ansible.com/ansible-f5.



Status
~~~~~~

This module is flagged as **preview** which means that it is not guaranteed to have a backwards compatible interface.


Support
~~~~~~~

This module is community maintained without core committer oversight.

For more information on what this means please read :doc:`/usage/support`


For help developing modules, should you be so inclined, please read :doc:`Getting Involved </development/getting-involved>`, :doc:`Writing a Module </development/writing-a-module>` and :doc:`Guidelines </development/guidelines>`.