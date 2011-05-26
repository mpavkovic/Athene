Ext.define('Athene.model.Group', {
    extend: 'Ext.data.Model',
    fields: [
        'id',
        'name'
    ],
    hasMany: {
        model: 'Group',
        name: 'groups'
    }
});