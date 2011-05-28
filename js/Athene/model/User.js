Ext.define('Athene.model.User', {
    extend: 'Ext.data.Model',
    fields: [
        'id',
        'username',
        'first_name',
        'last_name',
        'email',
        'password',
        'is_staff',
        'is_active',
        'is_superuser',
        'last_login',
        'date_joined'
    ],
    hasMany: {
        model: 'Group',
        name: 'groups'
    }
});