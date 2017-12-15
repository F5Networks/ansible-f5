.. _bigip_snmp:


bigip_snmp - Manipulate general SNMP settings on a BIG-IP
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.4


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* Manipulate general SNMP settings on a BIG-IP.


Requirements (on host that executes module)
-------------------------------------------

  * f5-sdk >= 2.2.0


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
                <tr><td>agent_authentication_traps<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>enabled</li><li>disabled</li></ul></td>
        <td><div>When <code>enabled</code>, ensures that the system sends authentication warning traps to the trap destinations. This is usually disabled by default on a BIG-IP.</div>        </td></tr>
                <tr><td>agent_status_traps<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>enabled</li><li>disabled</li></ul></td>
        <td><div>When <code>enabled</code>, ensures that the system sends a trap whenever the SNMP agent starts running or stops running. This is usually enabled by default on a BIG-IP.</div>        </td></tr>
                <tr><td>contact<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Specifies the name of the person who administers the SNMP service for this system.</div>        </td></tr>
                <tr><td>device_warning_traps<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>enabled</li><li>disabled</li></ul></td>
        <td><div>When <code>enabled</code>, ensures that the system sends device warning traps to the trap destinations. This is usually enabled by default on a BIG-IP.</div>        </td></tr>
                <tr><td>location<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Specifies the description of this system's physical location.</div>        </td></tr>
        </table>
    </br>



Examples
--------

 ::

    
    - name: Set snmp contact
      bigip_snmp:
        contact: Joe User
        password: secret
        server: lb.mydomain.com
        user: admin
        validate_certs: false
      delegate_to: localhost

    - name: Set snmp location
      bigip_snmp:
        location: US West 1
        password: secret
        server: lb.mydomain.com
        user: admin
        validate_certs: no
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
        <td> agent_status_traps </td>
        <td> Value that the agent status traps was set to. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> enabled </td>
    </tr>
            <tr>
        <td> contact </td>
        <td> The new value for the person who administers SNMP on the device. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> Joe User </td>
    </tr>
            <tr>
        <td> location </td>
        <td> The new value for the system's physical location. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> US West 1a </td>
    </tr>
            <tr>
        <td> device_warning_traps </td>
        <td> Value that the warning status traps was set to. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> enabled </td>
    </tr>
            <tr>
        <td> agent_authentication_traps </td>
        <td> Value that the authentication status traps was set to. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> enabled </td>
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