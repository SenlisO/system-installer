#!/bin/bash
# -*- coding: utf-8 -*-
#
#  set_locale.sh
#
#  Copyright 2019 Thomas Castleman <contact@draugeros.org>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#
#
set -e
set -o pipefail
set_LANG="$1"
setlocale ()
{
	sed -i 's/# $1.UTF-8 UTF-8/$1.UTF-8 UTF-8/g' /etc/locale.gen
	locale-gen
	update-locale LANG="$1.UTF-8" LANGUAGE
}
if [ "$set_LANG" == "english" ]; then
	setlocale "en_US"
elif [ "$set_LANG" == "chinese" ]; then
	setlocale "zh_CN"
elif [ "$set_LANG" == "japanese" ]; then
	setlocale "ja_JP"
elif [ "$set_LANG" == "spanish" ]; then
	setlocale "es_ES"
elif [ "$set_LANG" == "hindi" ]; then
	setlocale "hi_IN"
elif [ "$set_LANG" == "german" ]; then
	setlocale "de_DE"
elif [ "$set_LANG" == "french" ]; then
	setlocale "fr_CA"
elif [ "$set_LANG" == "italian" ]; then
	setlocale "it_IT"
elif [ "$set_LANG" == "korean" ]; then
	setlocale "ko_KR"
elif [ "$set_LANG" == "russian" ]; then
	setlocale "ru_RU"
else
	exit 0
fi
