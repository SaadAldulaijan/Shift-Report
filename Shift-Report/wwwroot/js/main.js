var app = new Vue({
    el: "#app",
    data: {
        loggedInUser: {
            username: null,
            name: null,
            badgeNo: 0
        },
        checklistModel: {
            id: 0,
            workplace: false,
            directories: false,
            boards: false,
            fax1: false,
            fax2: false,
            overhead: false,
            emergencyline: false,
            hotline: false,
            backuphotline: false,
            codeyellow: false,
            pagingtelephone: false,
            noofbattery: 0,
            noofpager: 0,
            noofchair: 0,
            noofundeliveredfax: 0,
            noofdictaphone: 0,
            noofheadphone: 0,
            noofradiophones: 0,
            noofradiophonescharger: 0,
            noofremotecontrol: 0,

        },
        // --------------------
        breakModel: {
            id: 0,
            agentName: '',
            remark: '',
            out: null,
            in: null,
            comment: ''
        },
        agents: [],
        loading: false,
        breaks: [],
        // ----------------------------
        eodPagerModel: {
            id: 0,
            pagerreceivedfrom: null,
            pagerreceivedat: null,
            pagerreceivedby: null,
            pagerissuedto: null,
            pagerissuedat: null,
            pagerissuedby: null,
        },
        //-----------------------
        emergencyCodeModel: {
            id: 0,
            code: null,
            location: null,
            callerbadge: null,
            callerext: null,
            receivedby: null,
            timereceived: null,
            comment: null
        },
        emergencyCodes: [],
        // -------------------
        accessCodeModel: {
            id: 0,
            accesstype: null,
            callername: null,
            callerbadge: null,
            callreceiver: null,
            telephoneno: null,
            agenttelephone: null,
            actime: null
        },
        accessCodes: [],
        //----------------------

        announcementModel: {
            id: 0,
            datetime: null,
            subject: null,
            doneby: null
        },
        announcements: [],
        //----------------------


        reportModel: {
            id: 0,
            checkList: null,
            break: [],
            eodPager: null,
            emergencyCode: [],
            accessCode: [],
            announcement: [],
            shift: null,
            details: null,
            doneby: null
        },
        reportViewModel: {
            shift: null,
            details: null
        }
    },
    methods: {
        async getLoggedInUser() {
            this.loading = true;
            await axios.get('api/Auth/GetLoggedInUser')
                .then(res => {
                    //console.log(res);
                    this.loggedInUser = res.data
                    console.log(this.loggedInUser);
                })
                .catch(err => {
                    console.log(err);
                })
                .then(() => {
                    this.loading = false;
                });
        },
        // -----------------------
        addChecklist(chklst) {
            this.reportModel.checkList = chklst;
            $("#tab-agent").tab('show');
            console.log(this.reportModel);
        },

        //---------------------------
        async getAgents() {
            this.loading = true;
            await axios.get('/api/Report')
                .then(res => {
                    console.log(res);
                    this.agents = res.data;
                    console.log(this.agents);
                })
                .catch(err => {
                    console.log(err);
                })
                .then(() => {
                    this.loading = false;
                });
        },
        addBreak(breakModel) {
            let newBreak = {
                agentName: breakModel.agentName,
                remark: breakModel.remark,
                out: breakModel.out,
                in: breakModel.in,
                comment: breakModel.comment
            }
            this.breaks.push(newBreak);
            this.reportModel.break = this.breaks;
            console.log(this.reportModel);
        },
        removeBreak(index) {
            this.breaks.splice(index, 1);
            this.reportModel.break = this.breaks;
            console.log(this.reportModel);
        },
        breakNext() {
            $("#tab-pager").tab('show');
        },

        //-----------------------------
        addEodPager(eodPagerModel) {
            this.reportModel.eodPager = eodPagerModel;
            console.log(this.reportModel);
            $("#tab-emergency").tab('show');
        },

        // --------------------------
        addEmergencyCode(emergencyCodeModel) {
            let newEmergencyCode = {
                code: emergencyCodeModel.code,
                location: emergencyCodeModel.location,
                callerbadge: emergencyCodeModel.callerbadge,
                callerext: emergencyCodeModel.callerext,
                receivedby: emergencyCodeModel.receivedby,
                timereceived: emergencyCodeModel.timereceived,
                comment: emergencyCodeModel.comment
            }
            this.emergencyCodes.push(newEmergencyCode);
            this.reportModel.emergencyCode = this.emergencyCodes;
            console.log(this.reportModel);
        },
        deleteEmergencyCode(i) {
            this.emergencyCodes.splice(i, 1);
            this.reportModel.emergencyCode = this.emergencyCodes;
        },
        emergencyCodeNext() {
            $("#tab-access").tab('show');
        },

        // ----------------
        addAccessCode(accessCodeModel) {
            let newAccessCode = {
                accesstype: accessCodeModel.accesstype,
                callername: accessCodeModel.callername,
                callerbadge: accessCodeModel.callerbadge,
                callreceiver: accessCodeModel.callreceiver,
                telephoneno: accessCodeModel.telephoneno,
                agenttelephone: accessCodeModel.agenttelephone,
                actime: accessCodeModel.actime
            };
            this.accessCodes.push(newAccessCode);
            this.reportModel.accessCode = this.accessCodes;
            console.log(this.reportModel);
        },
        deleteAccessCode(i) {
            this.accessCodes.splice(i, 1);
        },
        accessCodeNext() {
            $("#tab-announcement").tab('show');
        },

        //-------------------------
        addAnnouncement(announcementModel) {
            let newAnnouncement = {
                datetime: announcementModel.datetime,
                subject: announcementModel.subject,
                doneby: announcementModel.doneby
            };
            this.announcements.push(newAnnouncement);
            this.reportModel.announcement = this.announcements;
            console.log(this.reportModel);
        },
        deleteAnnouncement(i) {
            this.announcements.splice(i, 1);
        },
        announcementNext() {
            $("#tab-notes").tab('show');
        },

        // ------------------
        async generateReport(reportViewModel) {
            this.loading = true;
            this.reportModel.shift = reportViewModel.shift;
            this.reportModel.details = reportViewModel.details;
            // TODO:  think of how to get the logged in user
            // maybe session, maybe controller
            this.reportModel.doneby = this.loggedInUser.username;
            console.log(this.reportModel);
            await axios.post('/api/Report', this.reportModel)
                .then(res => {
                    console.log(res.data);
                })
                .catch(err => {
                    console.log(err);
                })
                .then(() => {
                    this.loading = false;
                });
        }
    },
    async mounted() {
        await this.getAgents();
        await this.getLoggedInUser();
    },
    computed: {

    }
});