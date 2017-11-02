.. _bigip_device_group:


bigip_device_group - Manage device groups on a BIG-IP
+++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.5


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* Managing device groups allows you to create HA pairs and clusters of BIG-IP devices. Usage of this module should be done in conjunction with the ``bigip_configsync_actions`` to sync configuration across the pair or cluster if auto-sync is disabled.


Requirements (on host that executes module)
-------------------------------------------

  * f5-sdk >= 2.2.3


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
                <tr><td>auto_sync<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>True</li><li>False</li></ul></td>
        <td><div>Indicates whether configuration synchronization occurs manually or automatically. When creating a new device group, this option will default to <code>false</code>.</div>        </td></tr>
                <tr><td>description<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Description of the device group.</div>        </td></tr>
                <tr><td>full_sync<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>True</li><li>False</li></ul></td>
        <td><div>Specifies whether the system synchronizes the entire configuration during synchronization operations. When <code>false</code>, the system performs incremental synchronization operations, based on the cache size specified in <code>max_incremental_sync_size</code>. Incremental configuration synchronization is a mechanism for synchronizing a device-group's configuration among its members, without requiring a full configuration load for each configuration change. In order for this to work, all devices in the device-group must initially agree on the configuration. Typically this requires at least one full configuration load to each device. When creating a new device group, this option will default to <code>false</code>.</div>        </td></tr>
                <tr><td>max_incremental_sync_size<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td></td>
        <td><div>Specifies the size of the changes cache for incremental sync. For example, using the default, if you make more than 1024 KB worth of incremental changes, the system performs a full synchronization operation. Using incremental synchronization operations can reduce the per-device sync/load time for configuration changes. This setting is relevant only when <code>full_sync</code> is <code>false</code>.</div>        </td></tr>
                <tr><td>name<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>Specifies the name of the device group.</div>        </td></tr>
                <tr><td>password<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The password for the user account used to connect to the BIG-IP. This option can be omitted if the environment variable <code>F5_PASSWORD</code> is set.</div>        </td></tr>
                <tr><td>save_on_auto_sync<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>True</li><li>False</li></ul></td>
        <td><div>When performing an auto-sync, specifies whether the configuration will be saved or not. If <code>false</code>, only the running configuration will be changed on the device(s) being synced to. When creating a new device group, this option will default to <code>false</code>.</div>        </td></tr>
                <tr><td>server<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The BIG-IP host. This option can be omitted if the environment variable <code>F5_SERVER</code> is set.</div>        </td></tr>
                <tr><td>server_port<br/><div style="font-size: small;"> (added in 2.2)</div></td>
    <td>no</td>
    <td>443</td>
        <td></td>
        <td><div>The BIG-IP server port. This option can be omitted if the environment variable <code>F5_SERVER_PORT</code> is set.</div>        </td></tr>
                <tr><td>type<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td>
        <td><ul><li>sync-failover</li><li>sync-only</li></ul></td>
        <td><div>Specifies that the type of group. A <code>sync-failover</code> device group contains devices that synchronize their configuration data and fail over to one another when a device becomes unavailable. A <code>sync-only</code> device group has no such failover. When creating a new device group, this option will default to <code>sync-only</code>. This setting cannot be changed once it has been set.</div>        </td></tr>
                <tr><td>user<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The username to connect to the BIG-IP with. This user must have administrative privileges on the device. This option can be omitted if the environment variable <code>F5_USER</code> is set.</div>        </td></tr>
                <tr><td>validate_certs<br/><div style="font-size: small;"> (added in 2.0)</div></td>
    <td>no</td>
    <td>True</td>
        <td><ul><li>True</li><li>False</li></ul></td>
        <td><div>If <code>no</code>, SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates. This option can be omitted if the environment variable <code>F5_VALIDATE_CERTS</code> is set.</div>        </td></tr>
        </table>
    </br>



Examples
--------

 ::

    
    - name: Create a sync-only device group
      bigip_device_group:
        name: foo-group
        password: secret
        server: lb.mydomain.com
        state: present
        user: admin
      delegate_to: localhost
    
    - name: Create a sync-only device group with auto-sync enabled
      bigip_device_group:
        name: foo-group
        auto_sync: yes
        password: secret
        server: lb.mydomain.com
        state: present
        user: admin
      delegate_to: localhost

Return Values
-------------

Common return values are documented here :doc:`common_return_values`, the following are the fields unique to this module:

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
        <td> save_on_auto_sync </td>
        <td> The new save_on_auto_sync value of the device group. </td>
        <td align=center> changed </td>
        <td align=center> bool </td>
        <td align=center> True </td>
    </tr>
            <tr>
        <td> description </td>
        <td> The new description of the device group. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> this is a device group </td>
    </tr>
            <tr>
        <td> full_sync </td>
        <td> The new full_sync value of the device group. </td>
        <td align=center> changed </td>
        <td align=center> bool </td>
        <td align=center> False </td>
    </tr>
            <tr>
        <td> auto_sync </td>
        <td> The new auto_sync value of the device group. </td>
        <td align=center> changed </td>
        <td align=center> bool </td>
        <td align=center> True </td>
    </tr>
            <tr>
        <td> type </td>
        <td> The new type of the device group. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> sync-failover </td>
    </tr>
            <tr>
        <td> max_incremental_sync_size </td>
        <td> The new sync size of the device group </td>
        <td align=center> changed </td>
        <td align=center> int </td>
        <td align=center> 1000 </td>
    </tr>
        
    </table>
    </br></br>

Notes
-----

.. note::
    - Requires the f5-sdk Python package on the host. This is as easy as pip install f5-sdk.
    - This module is primarily used as a component of configuring HA pairs of BIG-IP devices.
    - Requires BIG-IP >= 12.1.x.
    - For more information on using Ansible to manage F5 Networks devices see https://www.ansible.com/ansible-f5.



Status
~~~~~~

This module is flagged as **preview** which means that it is not guaranteed to have a backwards compatible interface.


Support
~~~~~~~

This module is community maintained without core committer oversight.

For more information on what this means please read :doc:`modules_support`


For help in developing on modules, should you be so inclined, please read :doc:`community`, :doc:`dev_guide/developing_test_pr` and :doc:`dev_guide/developing_modules`.