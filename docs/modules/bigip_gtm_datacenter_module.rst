.. _bigip_gtm_datacenter:


bigip_gtm_datacenter - Manage Datacenter configuration in BIG-IP
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.2


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* Manage BIG-IP data center configuration. A data center defines the location where the physical network components reside, such as the server and link objects that share the same subnet on the network. This module is able to manipulate the data center definitions in a BIG-IP.


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
                <tr><td>contact<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>The name of the contact for the data center.</div>        </td></tr>
                <tr><td>description<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>The description of the data center.</div>        </td></tr>
                <tr><td>enabled<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>True</li><li>False</li></ul></td>
        <td><div>Whether the data center should be enabled. At least one of <code>state</code> and <code>enabled</code> are required.</div><div>Deprecated in 2.4. Use <code>state</code> and either <code>enabled</code> or <code>disabled</code> instead.</div>        </td></tr>
                <tr><td>location<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>The location of the data center.</div>        </td></tr>
                <tr><td>name<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The name of the data center.</div>        </td></tr>
                <tr><td>state<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td>present</td>
        <td><ul><li>present</li><li>absent</li><li>enabled</li><li>disabled</li></ul></td>
        <td><div>The virtual address state. If <code>absent</code>, an attempt to delete the virtual address will be made. This will only succeed if this virtual address is not in use by a virtual server. <code>present</code> creates the virtual address and enables it. If <code>enabled</code>, enable the virtual address if it exists. If <code>disabled</code>, create the virtual address if needed, and set state to <code>disabled</code>.</div>        </td></tr>
        </table>
    </br>



Examples
--------

 ::

    
    - name: Create data center "New York"
      bigip_gtm_datacenter:
        server: lb.mydomain.com
        user: admin
        password: secret
        name: New York
        location: 222 West 23rd
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
        <td> contact </td>
        <td> The contact that was set on the datacenter. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> admin@root.local </td>
    </tr>
            <tr>
        <td> enabled </td>
        <td> Whether the datacenter is enabled or not </td>
        <td align=center> changed </td>
        <td align=center> bool </td>
        <td align=center> True </td>
    </tr>
            <tr>
        <td> description </td>
        <td> The description that was set for the datacenter. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> Datacenter in NYC </td>
    </tr>
            <tr>
        <td> location </td>
        <td> The location that is set for the datacenter. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> 222 West 23rd </td>
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