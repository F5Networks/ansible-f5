.. _bigip_virtual_server:


bigip_virtual_server - Manage LTM virtual servers on a BIG-IP
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.1


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* Manage LTM virtual servers on a BIG-IP.


Requirements (on host that executes module)
-------------------------------------------

  * f5-sdk
  * netaddr


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
                <tr><td>default_persistence_profile<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Default Profile which manages the session persistence.</div><div>If you want to remove the existing default persistence profile, specify an empty value; <code>""</code>. See the documentation for an example.</div>        </td></tr>
                <tr><td>description<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Virtual server description.</div>        </td></tr>
                <tr><td>destination<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>Destination IP of the virtual server.</div><div>Required when <code>state</code> is <code>present</code> and virtual server does not exist.</div></br>
    <div style="font-size: small;">aliases: address, ip<div>        </td></tr>
                <tr><td>disabled_vlans<br/><div style="font-size: small;"> (added in 2.5)</div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>List of VLANs to be disabled. If the partition is not specified in the VLAN, then the <code>partition</code> option of this module will be used.</div><div>This parameter is mutually exclusive with the <code>enabled_vlans</code> parameters.</div>        </td></tr>
                <tr><td>enabled_vlans<br/><div style="font-size: small;"> (added in 2.2)</div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>List of VLANs to be enabled. When a VLAN named <code>all</code> is used, all VLANs will be allowed. VLANs can be specified with or without the leading partition. If the partition is not specified in the VLAN, then the <code>partition</code> option of this module will be used.</div><div>This parameter is mutually exclusive with the <code>disabled_vlans</code> parameter.</div>        </td></tr>
                <tr><td>fallback_persistence_profile<br/><div style="font-size: small;"> (added in 2.3)</div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Specifies the persistence profile you want the system to use if it cannot use the specified default persistence profile.</div><div>If you want to remove the existing fallback persistence profile, specify an empty value; <code>""</code>. See the documentation for an example.</div>        </td></tr>
                <tr><td>irules<br/><div style="font-size: small;"> (added in 2.2)</div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>List of rules to be applied in priority order.</div><div>If you want to remove existing iRules, specify a single empty value; <code>""</code>. See the documentation for an example.</div></br>
    <div style="font-size: small;">aliases: all_rules<div>        </td></tr>
                <tr><td>name<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>Virtual server name.</div></br>
    <div style="font-size: small;">aliases: vs<div>        </td></tr>
                <tr><td>partition<br/><div style="font-size: small;"> (added in 2.5)</div></td>
    <td>no</td>
    <td>Common</td>
        <td></td>
        <td><div>Device partition to manage resources on.</div>        </td></tr>
                <tr><td>policies<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Specifies the policies for the virtual server</div></br>
    <div style="font-size: small;">aliases: all_policies<div>        </td></tr>
                <tr><td>pool<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Default pool for the virtual server.</div><div>If you want to remove the existing pool, specify an empty value; <code>""</code>. See the documentation for an example.</div>        </td></tr>
                <tr><td>port<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Port of the virtual server. Required when <code>state</code> is <code>present</code> and virtual server does not exist.</div><div>If you do not want to specify a particular port, use the value <code>0</code>. The result is that the virtual server will listen on any port.</div>        </td></tr>
                <tr><td rowspan="2">profiles<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td><td></td>
    <td> <div>List of profiles (HTTP, ClientSSL, ServerSSL, etc) to apply to both sides of the connection (client-side and server-side).</div><div>If you only want to apply a particular profile to the client-side of the connection, specify <code>client-side</code> for the profile's <code>context</code>.</div><div>If you only want to apply a particular profile to the server-side of the connection, specify <code>server-side</code> for the profile's <code>context</code>.</div><div>If <code>context</code> is not provided, it will default to <code>all</code>.</div></br>
    <div style="font-size: small;">aliases: all_profiles<div>    </tr>
    <tr>
    <td colspan="5">
    <table border=1 cellpadding=4>
    <caption><b>Dictionary object profiles</b></caption>
    <tr>
    <th class="head">parameter</th>
    <th class="head">required</th>
    <th class="head">default</th>
    <th class="head">choices</th>
    <th class="head">comments</th>
    </tr>
                    <tr><td>name<br/><div style="font-size: small;"></div></td>
        <td>no</td>
        <td></td>
                <td></td>
                <td><div>Name of the profile.</div><div>If this is not specified, then it is assumed that the profile item is only a name of a profile.</div><div>This must be specified if a context is specified.</div>        </td></tr>
                    <tr><td>context<br/><div style="font-size: small;"></div></td>
        <td>no</td>
        <td>all</td>
                <td><ul><li>all</li><li>server-side</li><li>client-side</li></ul></td>
                <td><div>The side of the connection on which the profile should be applied.</div>        </td></tr>
        </table>
    </td>
    </tr>
        </td></tr>
                <tr><td>route_advertisement_state<br/><div style="font-size: small;"> (added in 2.3)</div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>enabled</li><li>disabled</li></ul></td>
        <td><div>Enable route advertisement for destination.</div>        </td></tr>
                <tr><td>snat<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>None</li><li>Automap</li><li>Name of a SNAT pool (eg "/Common/snat_pool_name") to enable SNAT with the specific pool</li></ul></td>
        <td><div>Source network address policy.</div>        </td></tr>
                <tr><td>source<br/><div style="font-size: small;"> (added in 2.5)</div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Specifies an IP address or network from which the virtual server accepts traffic.</div><div>The virtual server accepts clients only from one of these IP addresses.</div><div>For this setting to function effectively, specify a value other than 0.0.0.0/0 or ::/0 (that is, any/0, any6/0).</div><div>In order to maximize utility of this setting, specify the most specific address prefixes covering all customer addresses and no others.</div><div>Specify the IP address in Classless Inter-Domain Routing (CIDR) format; address/prefix, where the prefix length is in bits. For example, for IPv4, 10.0.0.1/32 or 10.0.0.0/24, and for IPv6, ffe1::0020/64 or 2001:ed8:77b5:2:10:10:100:42/64.</div>        </td></tr>
                <tr><td>state<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td>present</td>
        <td><ul><li>present</li><li>absent</li><li>enabled</li><li>disabled</li></ul></td>
        <td><div>The virtual server state. If <code>absent</code>, delete the virtual server if it exists. <code>present</code> creates the virtual server and enable it. If <code>enabled</code>, enable the virtual server if it exists. If <code>disabled</code>, create the virtual server if needed, and set state to <code>disabled</code>.</div>        </td></tr>
        </table>
    </br>



Examples
--------

 ::

    
    - name: Modify Port of the Virtual Server
      bigip_virtual_server:
        server: lb.mydomain.net
        user: admin
        password: secret
        state: present
        partition: Common
        name: my-virtual-server
        port: 8080
      delegate_to: localhost

    - name: Delete virtual server
      bigip_virtual_server:
        server: lb.mydomain.net
        user: admin
        password: secret
        state: absent
        partition: Common
        name: my-virtual-server
      delegate_to: localhost

    - name: Add virtual server
      bigip_virtual_server:
        server: lb.mydomain.net
        user: admin
        password: secret
        state: present
        partition: Common
        name: my-virtual-server
        destination: 10.10.10.10
        port: 443
        pool: my-pool
        snat: Automap
        description: Test Virtual Server
        profiles:
          - http
          - fix
          - name: clientssl
            context: server-side
          - name: ilx
            context: client-side
        policies:
          - my-ltm-policy-for-asm
          - ltm-uri-policy
          - ltm-policy-2
          - ltm-policy-3
        enabled_vlans:
          - /Common/vlan2
      delegate_to: localhost

    - name: Add FastL4 virtual server
      bigip_virtual_server:
        destination: 1.1.1.1
        name: fastl4_vs
        port: 80
        profiles:
          - fastL4
        state: present

    - name: Add iRules to the Virtual Server
      bigip_virtual_server:
        server: lb.mydomain.net
        user: admin
        password: secret
        name: my-virtual-server
        irules:
          - irule1
          - irule2
      delegate_to: localhost

    - name: Remove one iRule from the Virtual Server
      bigip_virtual_server:
        server: lb.mydomain.net
        user: admin
        password: secret
        name: my-virtual-server
        irules:
          - irule2
      delegate_to: localhost

    - name: Remove all iRules from the Virtual Server
      bigip_virtual_server:
        server: lb.mydomain.net
        user: admin
        password: secret
        name: my-virtual-server
        irules: ""
      delegate_to: localhost

    - name: Remove pool from the Virtual Server
      bigip_virtual_server:
        server: lb.mydomain.net
        user: admin
        password: secret
        name: my-virtual-server
        pool: ""
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
        <td> deleted </td>
        <td> Name of a virtual server that was deleted </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> my-virtual-server </td>
    </tr>
        
    </table>
    </br></br>

Notes
-----

.. note::
    - Requires BIG-IP software version >= 11
    - Requires the f5-sdk Python package on the host. This is as easy as pip install f5-sdk.
    - Requires the netaddr Python package on the host. This is as easy as pip install netaddr.
    - For more information on using Ansible to manage F5 Networks devices see https://www.ansible.com/ansible-f5.



Status
~~~~~~

This module is flagged as **preview** which means that it is not guaranteed to have a backwards compatible interface.


Support
~~~~~~~

This module is community maintained without core committer oversight.

For more information on what this means please read :doc:`/usage/support`


For help developing modules, should you be so inclined, please read :doc:`Getting Involved </development/getting-involved>`, :doc:`Writing a Module </development/writing-a-module>` and :doc:`Guidelines </development/guidelines>`.