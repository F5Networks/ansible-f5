.. _bigiq_regkey_license:


bigiq_regkey_license - Manages licenses in a BIG-IQ registration key pool
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.5


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* Manages licenses in a BIG-IQ registration key pool.


Requirements (on host that executes module)
-------------------------------------------

  * f5-sdk >= 3.0.5
  * BIG-IQ >= 5.3.0


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
                <tr><td>accept_eula<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>A key that signifies that you accept the F5 EULA for this license.</div><div>A copy of the EULA can be found here https://askf5.f5.com/csp/article/K12902</div><div>This is required when <code>state</code> is <code>present</code>.</div>        </td></tr>
                <tr><td>description<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Description of the license.</div>        </td></tr>
                <tr><td>license_key<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The license key to put in the pool.</div>        </td></tr>
                <tr><td>regkey_pool<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The registration key pool that you want to place the license in.</div><div>You must be mindful to name your registration pools unique names. While BIG-IQ does not require this, this module does. If you do not do this, the behavior of the module is undefined and you may end up putting licenses in the wrong registration key pool.</div>        </td></tr>
                <tr><td>state<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td>present</td>
        <td><ul><li>absent</li><li>present</li></ul></td>
        <td><div>The state of the regkey license in the pool on the system.</div><div>When <code>present</code>, guarantees that the license exists in the pool.</div><div>When <code>absent</code>, removes the license from the pool.</div>        </td></tr>
        </table>
    </br>



Examples
--------

 ::

    
    - name: Add a registration key license to a pool
      bigiq_regkey_license:
        regkey_pool: foo-pool
        license_key: XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
        accept_eula: yes
        password: secret
        server: lb.mydomain.com
        state: present
        user: admin
      delegate_to: localhost

    - name: Remove a registration key license from a pool
      bigiq_regkey_license:
        regkey_pool: foo-pool
        license_key: XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
        password: secret
        server: lb.mydomain.com
        state: absent
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
        <td> description </td>
        <td> The new description of the license key. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> My license for BIG-IP 1 </td>
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