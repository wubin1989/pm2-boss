class ProcessEntity {
	int pid;
	String name;
	Pm2Env pm2Env;
	int pmId;
	Monit monit;

	ProcessEntity({this.pid, this.name, this.pm2Env, this.pmId, this.monit});

	ProcessEntity.fromJson(Map<String, dynamic> json) {
		pid = json['pid'];
		name = json['name'];
		pm2Env =
		json['pm2_env'] != null ? new Pm2Env.fromJson(json['pm2_env']) : null;
		pmId = json['pm_id'];
		monit = json['monit'] != null ? new Monit.fromJson(json['monit']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['pid'] = this.pid;
		data['name'] = this.name;
		if (this.pm2Env != null) {
			data['pm2_env'] = this.pm2Env.toJson();
		}
		data['pm_id'] = this.pmId;
		if (this.monit != null) {
			data['monit'] = this.monit.toJson();
		}
		return data;
	}
}

class Pm2Env {
	bool autorestart;
	String name;
	String pmExecPath;
	String pmCwd;
	String execInterpreter;
	int instances;
	String pmOutLogPath;
	String pmErrLogPath;
	String pmPidPath;
	String sHELL;
	String tERMPROGRAM;
	String pM2HOME;
	String uniqueId;
	String status;
	int pmUptime;
	int createdAt;
	int pmId;
	int restartTime;
	int unstableRestarts;
	String version;
	Versioning versioning;

	Pm2Env(
			{this.autorestart,
				this.name,
				this.pmExecPath,
				this.pmCwd,
				this.execInterpreter,
				this.instances,
				this.pmOutLogPath,
				this.pmErrLogPath,
				this.pmPidPath,
				this.sHELL,
				this.tERMPROGRAM,
				this.pM2HOME,
				this.uniqueId,
				this.status,
				this.pmUptime,
				this.createdAt,
				this.pmId,
				this.restartTime,
				this.unstableRestarts,
				this.version,
				this.versioning});

	Pm2Env.fromJson(Map<String, dynamic> json) {
		autorestart = json['autorestart'];
		name = json['name'];
		pmExecPath = json['pm_exec_path'];
		pmCwd = json['pm_cwd'];
		execInterpreter = json['exec_interpreter'];
		instances = json['instances'];
		pmOutLogPath = json['pm_out_log_path'];
		pmErrLogPath = json['pm_err_log_path'];
		pmPidPath = json['pm_pid_path'];
		sHELL = json['SHELL'];
		tERMPROGRAM = json['TERM_PROGRAM'];
		pM2HOME = json['PM2_HOME'];
		uniqueId = json['unique_id'];
		status = json['status'];
		pmUptime = json['pm_uptime'];
		createdAt = json['created_at'];
		pmId = json['pm_id'];
		restartTime = json['restart_time'];
		unstableRestarts = json['unstable_restarts'];
		version = json['version'];
		versioning = json['versioning'] != null
				? new Versioning.fromJson(json['versioning'])
				: null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['autorestart'] = this.autorestart;
		data['name'] = this.name;
		data['pm_exec_path'] = this.pmExecPath;
		data['pm_cwd'] = this.pmCwd;
		data['exec_interpreter'] = this.execInterpreter;
		data['instances'] = this.instances;
		data['pm_out_log_path'] = this.pmOutLogPath;
		data['pm_err_log_path'] = this.pmErrLogPath;
		data['pm_pid_path'] = this.pmPidPath;
		data['SHELL'] = this.sHELL;
		data['TERM_PROGRAM'] = this.tERMPROGRAM;
		data['PM2_HOME'] = this.pM2HOME;
		data['unique_id'] = this.uniqueId;
		data['status'] = this.status;
		data['pm_uptime'] = this.pmUptime;
		data['created_at'] = this.createdAt;
		data['pm_id'] = this.pmId;
		data['restart_time'] = this.restartTime;
		data['unstable_restarts'] = this.unstableRestarts;
		data['version'] = this.version;
		if (this.versioning != null) {
			data['versioning'] = this.versioning.toJson();
		}
		return data;
	}
}

class Versioning {
	String type;
	String url;
	String revision;
	String comment;
	bool unstaged;
	String branch;
	List<String> remotes;
	String remote;
	bool branchExistsOnRemote;
	bool ahead;
	Null nextRev;
	String prevRev;
	String updateTime;
	String repoPath;

	Versioning(
			{this.type,
				this.url,
				this.revision,
				this.comment,
				this.unstaged,
				this.branch,
				this.remotes,
				this.remote,
				this.branchExistsOnRemote,
				this.ahead,
				this.nextRev,
				this.prevRev,
				this.updateTime,
				this.repoPath});

	Versioning.fromJson(Map<String, dynamic> json) {
		type = json['type'];
		url = json['url'];
		revision = json['revision'];
		comment = json['comment'];
		unstaged = json['unstaged'];
		branch = json['branch'];
		remotes = json['remotes'].cast<String>();
		remote = json['remote'];
		branchExistsOnRemote = json['branch_exists_on_remote'];
		ahead = json['ahead'];
		nextRev = json['next_rev'];
		prevRev = json['prev_rev'];
		updateTime = json['update_time'];
		repoPath = json['repo_path'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['type'] = this.type;
		data['url'] = this.url;
		data['revision'] = this.revision;
		data['comment'] = this.comment;
		data['unstaged'] = this.unstaged;
		data['branch'] = this.branch;
		data['remotes'] = this.remotes;
		data['remote'] = this.remote;
		data['branch_exists_on_remote'] = this.branchExistsOnRemote;
		data['ahead'] = this.ahead;
		data['next_rev'] = this.nextRev;
		data['prev_rev'] = this.prevRev;
		data['update_time'] = this.updateTime;
		data['repo_path'] = this.repoPath;
		return data;
	}
}

class Monit {
	int memory;
	num cpu;

	Monit({this.memory, this.cpu});

	Monit.fromJson(Map<String, dynamic> json) {
		memory = json['memory'];
		cpu = json['cpu'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['memory'] = this.memory;
		data['cpu'] = this.cpu;
		return data;
	}
}
