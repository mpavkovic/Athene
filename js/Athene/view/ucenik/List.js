Ext.define('Athene.view.ucenik.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.uceniklist',
    id: 'uceniklist',
    
    title: 'Popis Učenika',
    layout: 'fit',
    width: 950,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'ucenikgrid',
                store: 'Ucenik',
                forceFit: true,
                columns: [
                    {
                        text: 'OIB',
                        dataIndex: 'oib'
                    },
                    {
                        text: 'JMBG',
                        dataIndex: 'jmbg'
                    },
                    {
                        text: 'Ime',
                        dataIndex: 'ime'
                    },
                    {
                        text: 'Prezime',
                        dataIndex: 'prezime'
                    },
                    {
                        text: 'Datum rođenja',
                        dataIndex: 'datum_rodjenja'
                    },
                    {
                        text: 'Spol',
                        dataIndex: 'spol'
                    },
                    {
                        text: 'Otac ime nom',
                        dataIndex: 'otac_ime_nom'
                    },
                    {
                        text: 'Otac ime gen',
                        dataIndex: 'otac_ime_gen'
                    },
                    {
                        text: 'Majka ime nom',
                        dataIndex: 'majka_ime_nom'
                    },
                    {
                        text: 'Majka ime gen',
                        dataIndex: 'Majka_ime_gen'
                    },
                    {
                        text: 'Majka djevojačko',
                        dataIndex: 'majka_djevojacko'
                    },
                    {
                        text: 'Stranac',
                        dataIndex: 'stranac'
                    },
                    {
                        text: 'Školovanje izvan RH',
                        dataIndex: 'skolovanje_izvan_rh'
                    },
                    {
                        text: 'Sportaš',
                        dataIndex: 'sportas'
                    },
                    {
                        text: 'Broj domovnice',
                        dataIndex: 'broj_domovnice'
                    },
                    {
                        text: 'SMB',
                        dataIndex: 'smb'
                    },
                    {
                        text: 'SMB datum od',
                        dataIndex: 'smb_datum_od'
                    },
                    {
                        text: 'SMB datum do',
                        dataIndex: 'smb_datum_do'
                    },
                    {
                        text: 'Hospitant',
                        dataIndex: 'hospitant'
                    },
                    {
                        text: 'Mjesto rođenja',
                        dataIndex: 'mjesto_rodjenja_id'
                    },
                    {
                        text: 'Narodnost',
                        dataIndex: 'narodnost_id'
                    },
                    {
                        text: 'Nacionalna manjina',
                        dataIndex: 'nacionalna_manjina_id'
                    },
                    {
                        text: 'Vrsta putnika',
                        dataIndex: 'vrsta_putnika_id'
                    },
                    {
                        text: 'Otac zanimanje',
                        dataIndex: 'otac_zanimanje_id'
                    },
                    {
                        text: 'Majka zanimanje',
                        dataIndex: 'majka_zanimanje_id'
                    }
                ]
            }
        ];
        
        this.dockedItems = [
            {
                xtype: 'toolbar',
                dock: 'top',
                items: [
                    {
                        xtype: 'button',
                        icon: 'img/icons/add.png',
                        text: 'Dodaj učenika', 
                        id: 'openUcenikForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});