.. _bigip_irule:


bigip_irule - Manage iRules across different modules on a BIG-IP
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.2


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* Manage iRules across different modules on a BIG-IP.


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
                <tr><td>content<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>When used instead of 'src', sets the contents of an iRule directly to the specified value. This is for simple values, but can be used with lookup plugins for anything complex or with formatting. Either one of <code>src</code> or <code>content</code> must be provided.</div>        </td></tr>
                <tr><td>module<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td><ul><li>ltm</li><li>gtm</li></ul></td>
        <td><div>The BIG-IP module to add the iRule to.</div>        </td></tr>
                <tr><td>name<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The name of the iRule.</div>        </td></tr>
                <tr><td>partition<br/><div style="font-size: small;"> (added in 2.5)</div></td>
    <td>no</td>
    <td>Common</td>
        <td></td>
        <td><div>Device partition to manage resources on.</div>        </td></tr>
                <tr><td>src<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The iRule file to interpret and upload to the BIG-IP. Either one of <code>src</code> or <code>content</code> must be provided.</div>        </td></tr>
                <tr><td>state<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td>present</td>
        <td><ul><li>present</li><li>absent</li></ul></td>
        <td><div>Whether the iRule should exist or not.</div>        </td></tr>
        </table>
    </br>



Examples
--------

 ::

    
    - name: Add the iRule contained in template irule.tcl to the LTM module
      bigip_irule:
        content: "{{ lookup('template', 'irule.tcl') }}"
        module: ltm
        name: MyiRule
        password: secret
        server: lb.mydomain.com
        state: present
        user: admin
      delegate_to: localhost

    - name: Add the iRule contained in static file irule.tcl to the LTM module
      bigip_irule:
        module: ltm
        name: MyiRule
        password: secret
        server: lb.mydomain.com
        src: irule.tcl
        state: present
        user: admin
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
        <td> content </td>
        <td> The content of the iRule that was managed </td>
        <td align=center> changed and success </td>
        <td align=center> string </td>
        <td align=center> when LB_FAILED { set wipHost [LB::server addr] } </td>
    </tr>
            <tr>
        <td> src </td>
        <td> The filename that included the iRule source </td>
        <td align=center> changed and success, when provided </td>
        <td align=center> string </td>
        <td align=center> /opt/src/irules/example1.tcl </td>
    </tr>
            <tr>
        <td> module </td>
        <td> The module that the iRule was added to </td>
        <td align=center> changed and success </td>
        <td align=center> string </td>
        <td align=center> gtm </td>
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