/*
 * Copyright (C) 1996-2015 The Squid Software Foundation and contributors
 *
 * Squid software is distributed under GPLv2+ license and includes
 * contributions from numerous individuals and organizations.
 * Please see the COPYING and CONTRIBUTORS files for details.
 */

#include "squid.h"

#define STUB_API "tunnel.cc"
#include "tests/STUB.h"

#include "FwdState.h"
class ClientHttpRequest;

void tunnelStart(ClientHttpRequest *, int64_t *, int *, const AccessLogEntryPointer &al) STUB

void switchToTunnel(HttpRequest *request, Comm::ConnectionPointer &clientConn, Comm::ConnectionPointer &srvConn) STUB

